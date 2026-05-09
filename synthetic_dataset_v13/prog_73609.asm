; DESCRIPTION: Places a green line segment connecting (234, 63) to (243, 165).
; PLAN: r0=234(x1), r1=63(y1), r2=243(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 63
LDI r2, 243
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
