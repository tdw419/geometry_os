; DESCRIPTION: Composite: Draws a green line from (330, 235) to (451, 206) then Sets a single purple pixel at (171, 34).
; PLAN: r0=330(x1), r1=235(y1), r2=451(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=34(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 235
LDI r2, 451
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 34
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
