; DESCRIPTION: Places a yellow line segment connecting (243, 174) to (326, 215).
; PLAN: r0=243(x1), r1=174(y1), r2=326(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 174
LDI r2, 326
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
