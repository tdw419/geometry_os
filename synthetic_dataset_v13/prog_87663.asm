; DESCRIPTION: Places a cyan line segment connecting (166, 28) to (253, 29).
; PLAN: r0=166(x1), r1=28(y1), r2=253(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 28
LDI r2, 253
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
