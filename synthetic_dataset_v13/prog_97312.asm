; DESCRIPTION: Composite: Draws a blue line from (371, 233) to (293, 237) then Renders a green disk with center (309, 172) and radius 27.
; PLAN: r0=371(x1), r1=233(y1), r2=293(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=172(y), r7=27(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 371
LDI r1, 233
LDI r2, 293
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 172
LDI r7, 27
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
