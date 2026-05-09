; DESCRIPTION: Places a green line segment connecting (237, 27) to (166, 76).
; PLAN: r0=237(x1), r1=27(y1), r2=166(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 27
LDI r2, 166
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
