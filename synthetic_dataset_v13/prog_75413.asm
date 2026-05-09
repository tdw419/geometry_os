; DESCRIPTION: Draws a green line from (252, 108) to (415, 86).
; PLAN: r0=252(x1), r1=108(y1), r2=415(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 108
LDI r2, 415
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
