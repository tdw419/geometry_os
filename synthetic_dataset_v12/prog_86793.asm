; DESCRIPTION: Composite: Renders a orange disk with center (348, 79) and radius 52 then Sets a single cyan pixel at (363, 222) then Draws a white line from (388, 223) to (175, 38).
; PLAN: r0=348(x), r1=79(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=222(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=388(x1), r11=223(y1), r12=175(x2), r13=38(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 79
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 222
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 388
LDI r11, 223
LDI r12, 175
LDI r13, 38
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
