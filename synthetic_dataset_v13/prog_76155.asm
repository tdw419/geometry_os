; DESCRIPTION: Draws a green line from (151, 240) to (253, 192).
; PLAN: r0=151(x1), r1=240(y1), r2=253(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 240
LDI r2, 253
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
