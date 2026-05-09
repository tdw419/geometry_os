; DESCRIPTION: Composite: Renders a green line between points (444, 194) and (493, 233) then Creates a purple rectangular region at (253, 180) spanning 31 by 19 pixels.
; PLAN: r0=444(x1), r1=194(y1), r2=493(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=180(y), r7=31(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 194
LDI r2, 493
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 180
LDI r7, 31
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
