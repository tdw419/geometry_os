; DESCRIPTION: Draws a red line from (353, 199) to (391, 210).
; PLAN: r0=353(x1), r1=199(y1), r2=391(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 199
LDI r2, 391
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
