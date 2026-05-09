; DESCRIPTION: Places a green line segment connecting (121, 149) to (511, 231).
; PLAN: r0=121(x1), r1=149(y1), r2=511(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 149
LDI r2, 511
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
