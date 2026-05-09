; DESCRIPTION: Places a white line segment connecting (27, 29) to (24, 68).
; PLAN: r0=27(x1), r1=29(y1), r2=24(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 29
LDI r2, 24
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
