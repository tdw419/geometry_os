; DESCRIPTION: Draws a cyan line from (271, 84) to (222, 207).
; PLAN: r0=271(x1), r1=84(y1), r2=222(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 84
LDI r2, 222
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
