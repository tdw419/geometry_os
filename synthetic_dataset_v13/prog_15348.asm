; DESCRIPTION: Places a yellow line segment connecting (32, 245) to (346, 199).
; PLAN: r0=32(x1), r1=245(y1), r2=346(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 245
LDI r2, 346
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
