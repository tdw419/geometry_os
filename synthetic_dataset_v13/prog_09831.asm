; DESCRIPTION: Composite: Renders a yellow line between points (16, 32) and (406, 144) then Renders a purple box of size 44x99 starting at (216, 116).
; PLAN: r0=16(x1), r1=32(y1), r2=406(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=116(y), r7=44(width), r8=99(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 32
LDI r2, 406
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 116
LDI r7, 44
LDI r8, 99
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
