; DESCRIPTION: Composite: Places a purple dot at position (225, 144) then Renders a green line between points (511, 189) and (236, 138) then Places a magenta 106x32 rectangle at position (214, 153).
; PLAN: r0=225(x), r1=144(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=511(x1), r6=189(y1), r7=236(x2), r8=138(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=153(y), r12=106(width), r13=32(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 144
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 511
LDI r6, 189
LDI r7, 236
LDI r8, 138
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 153
LDI r12, 106
LDI r13, 32
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
