; DESCRIPTION: Composite: Renders a green box of size 81x19 starting at (66, 112) then Renders a purple line between points (111, 189) and (124, 244).
; PLAN: r0=66(x), r1=112(y), r2=81(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x1), r6=189(y1), r7=124(x2), r8=244(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 112
LDI r2, 81
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 189
LDI r7, 124
LDI r8, 244
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
