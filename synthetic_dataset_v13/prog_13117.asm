; DESCRIPTION: Composite: Places a red dot at position (300, 12) then Renders a yellow box of size 85x19 starting at (188, 66) then Renders a green line between points (367, 210) and (270, 49).
; PLAN: r0=300(x), r1=12(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=66(y), r7=85(width), r8=19(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x1), r11=210(y1), r12=270(x2), r13=49(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 12
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 188
LDI r6, 66
LDI r7, 85
LDI r8, 19
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 210
LDI r12, 270
LDI r13, 49
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
