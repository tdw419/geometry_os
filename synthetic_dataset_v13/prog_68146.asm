; DESCRIPTION: Composite: Places a cyan line segment connecting (292, 75) to (139, 84) then Renders a magenta box of size 81x63 starting at (236, 38) then Places a purple circle of radius 64 at center (295, 124).
; PLAN: r0=292(x1), r1=75(y1), r2=139(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=236(x), r6=38(y), r7=81(width), r8=63(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x), r11=124(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 75
LDI r2, 139
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 38
LDI r7, 81
LDI r8, 63
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 124
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
