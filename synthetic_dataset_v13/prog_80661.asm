; DESCRIPTION: Places a cyan line segment connecting (506, 116) to (135, 161).
; PLAN: r0=506(x1), r1=116(y1), r2=135(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 116
LDI r2, 135
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
