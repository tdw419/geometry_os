; DESCRIPTION: Draws a black line from (401, 84) to (199, 225).
; PLAN: r0=401(x1), r1=84(y1), r2=199(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 84
LDI r2, 199
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
