; DESCRIPTION: Draws a green line from (366, 242) to (32, 99).
; PLAN: r0=366(x1), r1=242(y1), r2=32(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 242
LDI r2, 32
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
