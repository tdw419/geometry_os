; DESCRIPTION: Places a green line segment connecting (127, 42) to (355, 237).
; PLAN: r0=127(x1), r1=42(y1), r2=355(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 42
LDI r2, 355
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
