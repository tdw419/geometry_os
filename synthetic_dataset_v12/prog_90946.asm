; DESCRIPTION: Places a green line segment connecting (36, 130) to (355, 42).
; PLAN: r0=36(x1), r1=130(y1), r2=355(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 130
LDI r2, 355
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
