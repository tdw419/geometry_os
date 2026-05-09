; DESCRIPTION: Places a cyan line segment connecting (101, 148) to (420, 126).
; PLAN: r0=101(x1), r1=148(y1), r2=420(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 148
LDI r2, 420
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
