; DESCRIPTION: Composite: Renders a green line between points (388, 19) and (353, 220) then Sets a single blue pixel at (171, 113).
; PLAN: r0=388(x1), r1=19(y1), r2=353(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=171(x), r6=113(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 19
LDI r2, 353
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 113
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
