; DESCRIPTION: Places a cyan line segment connecting (56, 253) to (111, 8).
; PLAN: r0=56(x1), r1=253(y1), r2=111(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 253
LDI r2, 111
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
