; DESCRIPTION: Places a green line segment connecting (154, 199) to (178, 28).
; PLAN: r0=154(x1), r1=199(y1), r2=178(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 199
LDI r2, 178
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
