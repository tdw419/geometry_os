; DESCRIPTION: Composite: Creates a cyan rectangular region at (273, 30) spanning 89 by 81 pixels then Places a cyan dot at position (179, 8) then Renders a cyan line between points (253, 154) and (356, 73).
; PLAN: r0=273(x), r1=30(y), r2=89(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=8(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=253(x1), r11=154(y1), r12=356(x2), r13=73(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 30
LDI r2, 89
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 8
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 253
LDI r11, 154
LDI r12, 356
LDI r13, 73
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
