; DESCRIPTION: Places a black line segment connecting (275, 154) to (128, 178).
; PLAN: r0=275(x1), r1=154(y1), r2=128(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 154
LDI r2, 128
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
