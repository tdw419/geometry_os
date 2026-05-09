; DESCRIPTION: Composite: Renders a yellow line between points (241, 107) and (258, 4) then Places a magenta dot at position (113, 154) then Places a white 111x71 rectangle at position (35, 123).
; PLAN: r0=241(x1), r1=107(y1), r2=258(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=154(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=35(x), r11=123(y), r12=111(width), r13=71(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 107
LDI r2, 258
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 154
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 35
LDI r11, 123
LDI r12, 111
LDI r13, 71
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
