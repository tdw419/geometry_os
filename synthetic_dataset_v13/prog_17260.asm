; DESCRIPTION: Places a yellow line segment connecting (492, 82) to (324, 236).
; PLAN: r0=492(x1), r1=82(y1), r2=324(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 82
LDI r2, 324
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
