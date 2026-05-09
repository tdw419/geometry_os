; DESCRIPTION: Draws a cyan line from (229, 84) to (476, 26).
; PLAN: r0=229(x1), r1=84(y1), r2=476(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 84
LDI r2, 476
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
