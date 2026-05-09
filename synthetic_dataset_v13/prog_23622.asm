; DESCRIPTION: Places a cyan line segment connecting (162, 163) to (245, 169).
; PLAN: r0=162(x1), r1=163(y1), r2=245(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 163
LDI r2, 245
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
