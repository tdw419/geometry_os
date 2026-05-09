; DESCRIPTION: Places a cyan line segment connecting (10, 46) to (307, 88).
; PLAN: r0=10(x1), r1=46(y1), r2=307(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 46
LDI r2, 307
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
