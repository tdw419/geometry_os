; DESCRIPTION: Draws a cyan line from (199, 181) to (313, 182).
; PLAN: r0=199(x1), r1=181(y1), r2=313(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 181
LDI r2, 313
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
