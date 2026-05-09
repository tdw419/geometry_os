; DESCRIPTION: Places a cyan line segment connecting (52, 101) to (173, 130).
; PLAN: r0=52(x1), r1=101(y1), r2=173(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 101
LDI r2, 173
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
