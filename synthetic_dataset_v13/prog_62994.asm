; DESCRIPTION: Composite: Draws a orange line from (90, 255) to (171, 69) then Sets a single yellow pixel at (317, 215).
; PLAN: r0=90(x1), r1=255(y1), r2=171(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=215(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 255
LDI r2, 171
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 215
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
