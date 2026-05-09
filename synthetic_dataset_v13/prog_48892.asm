; DESCRIPTION: Draws a white line from (489, 17) to (171, 210).
; PLAN: r0=489(x1), r1=17(y1), r2=171(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 17
LDI r2, 171
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
