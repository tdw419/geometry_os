; DESCRIPTION: Places a green line segment connecting (289, 42) to (258, 255).
; PLAN: r0=289(x1), r1=42(y1), r2=258(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 42
LDI r2, 258
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
