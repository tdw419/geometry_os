; DESCRIPTION: Composite: Draws a orange line from (356, 219) to (349, 239) then Renders a orange disk with center (90, 164) and radius 38.
; PLAN: r0=356(x1), r1=219(y1), r2=349(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=90(x), r6=164(y), r7=38(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 219
LDI r2, 349
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 164
LDI r7, 38
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
