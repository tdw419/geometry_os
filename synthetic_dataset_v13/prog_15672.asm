; DESCRIPTION: Composite: Renders a green line between points (320, 214) and (290, 86) then Sets a single red pixel at (385, 220).
; PLAN: r0=320(x1), r1=214(y1), r2=290(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=220(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 320
LDI r1, 214
LDI r2, 290
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 220
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
