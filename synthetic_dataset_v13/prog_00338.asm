; DESCRIPTION: Places a cyan line segment connecting (380, 153) to (288, 101).
; PLAN: r0=380(x1), r1=153(y1), r2=288(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 153
LDI r2, 288
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
