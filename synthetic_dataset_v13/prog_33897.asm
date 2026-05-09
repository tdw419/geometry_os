; DESCRIPTION: Draws a cyan line from (349, 231) to (145, 232).
; PLAN: r0=349(x1), r1=231(y1), r2=145(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 231
LDI r2, 145
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
