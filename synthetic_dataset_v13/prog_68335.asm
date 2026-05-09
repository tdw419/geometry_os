; DESCRIPTION: Draws a green line from (464, 237) to (363, 108).
; PLAN: r0=464(x1), r1=237(y1), r2=363(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 237
LDI r2, 363
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
