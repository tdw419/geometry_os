; DESCRIPTION: Places a green line segment connecting (274, 5) to (380, 128).
; PLAN: r0=274(x1), r1=5(y1), r2=380(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 5
LDI r2, 380
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
