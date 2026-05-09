; DESCRIPTION: Draws a white line from (192, 108) to (197, 234).
; PLAN: r0=192(x1), r1=108(y1), r2=197(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 108
LDI r2, 197
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
