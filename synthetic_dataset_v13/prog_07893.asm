; DESCRIPTION: Composite: Places a orange line segment connecting (260, 108) to (143, 239) then Sets a single red pixel at (229, 134).
; PLAN: r0=260(x1), r1=108(y1), r2=143(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=229(x), r6=134(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 260
LDI r1, 108
LDI r2, 143
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 134
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
