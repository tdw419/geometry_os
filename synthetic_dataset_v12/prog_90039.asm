; DESCRIPTION: Places a cyan line segment connecting (253, 81) to (57, 166).
; PLAN: r0=253(x1), r1=81(y1), r2=57(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 81
LDI r2, 57
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
