; DESCRIPTION: Draws a cyan line from (199, 223) to (108, 84).
; PLAN: r0=199(x1), r1=223(y1), r2=108(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 223
LDI r2, 108
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
