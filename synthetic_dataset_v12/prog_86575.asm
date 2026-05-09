; DESCRIPTION: Places a cyan line segment connecting (58, 10) to (191, 153).
; PLAN: r0=58(x1), r1=10(y1), r2=191(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 10
LDI r2, 191
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
