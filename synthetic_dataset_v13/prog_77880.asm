; DESCRIPTION: Draws a cyan line from (163, 85) to (234, 98).
; PLAN: r0=163(x1), r1=85(y1), r2=234(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 85
LDI r2, 234
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
