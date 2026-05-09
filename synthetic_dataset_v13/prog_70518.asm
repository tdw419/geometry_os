; DESCRIPTION: Composite: Draws a orange line from (494, 239) to (439, 27) then Renders a white disk with center (352, 19) and radius 14.
; PLAN: r0=494(x1), r1=239(y1), r2=439(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=352(x), r6=19(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 239
LDI r2, 439
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 19
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
