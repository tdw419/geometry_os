; DESCRIPTION: Places a green line segment connecting (48, 253) to (468, 240).
; PLAN: r0=48(x1), r1=253(y1), r2=468(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 253
LDI r2, 468
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
