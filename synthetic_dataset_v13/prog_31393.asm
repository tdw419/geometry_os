; DESCRIPTION: Draws a cyan line from (48, 155) to (431, 22).
; PLAN: r0=48(x1), r1=155(y1), r2=431(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 155
LDI r2, 431
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
