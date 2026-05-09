; DESCRIPTION: Places a cyan line segment connecting (113, 46) to (312, 28).
; PLAN: r0=113(x1), r1=46(y1), r2=312(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 46
LDI r2, 312
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
