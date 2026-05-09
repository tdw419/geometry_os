; DESCRIPTION: Composite: Draws a white line from (34, 237) to (29, 209) then Renders a purple disk with center (324, 86) and radius 77.
; PLAN: r0=34(x1), r1=237(y1), r2=29(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=86(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 34
LDI r1, 237
LDI r2, 29
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 86
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
