; DESCRIPTION: Draws a green line from (199, 203) to (500, 210).
; PLAN: r0=199(x1), r1=203(y1), r2=500(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 203
LDI r2, 500
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
