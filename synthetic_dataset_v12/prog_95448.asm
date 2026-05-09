; DESCRIPTION: Composite: Renders a blue line between points (301, 66) and (464, 42) then Renders a yellow box of size 19x105 starting at (364, 15).
; PLAN: r0=301(x1), r1=66(y1), r2=464(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=15(y), r7=19(width), r8=105(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 66
LDI r2, 464
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 15
LDI r7, 19
LDI r8, 105
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
