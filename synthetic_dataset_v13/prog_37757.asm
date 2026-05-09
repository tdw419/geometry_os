; DESCRIPTION: Draws a cyan line from (500, 212) to (429, 65).
; PLAN: r0=500(x1), r1=212(y1), r2=429(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 212
LDI r2, 429
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
