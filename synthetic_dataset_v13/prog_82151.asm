; DESCRIPTION: Places a cyan line segment connecting (101, 204) to (465, 81).
; PLAN: r0=101(x1), r1=204(y1), r2=465(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 204
LDI r2, 465
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
