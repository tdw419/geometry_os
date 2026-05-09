; DESCRIPTION: Places a cyan line segment connecting (431, 103) to (182, 169).
; PLAN: r0=431(x1), r1=103(y1), r2=182(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 103
LDI r2, 182
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
