; DESCRIPTION: Places a cyan line segment connecting (392, 188) to (234, 118).
; PLAN: r0=392(x1), r1=188(y1), r2=234(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 188
LDI r2, 234
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
