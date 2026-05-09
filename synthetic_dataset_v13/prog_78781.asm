; DESCRIPTION: Draws a blue line from (305, 73) to (252, 176).
; PLAN: r0=305(x1), r1=73(y1), r2=252(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 73
LDI r2, 252
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
