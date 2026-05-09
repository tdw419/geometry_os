; DESCRIPTION: Places a green line segment connecting (24, 229) to (218, 166).
; PLAN: r0=24(x1), r1=229(y1), r2=218(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 229
LDI r2, 218
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
