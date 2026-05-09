; DESCRIPTION: Places a yellow line segment connecting (346, 206) to (170, 64).
; PLAN: r0=346(x1), r1=206(y1), r2=170(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 206
LDI r2, 170
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
