; DESCRIPTION: Places a white line segment connecting (12, 98) to (326, 255).
; PLAN: r0=12(x1), r1=98(y1), r2=326(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 98
LDI r2, 326
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
