; DESCRIPTION: Places a cyan line segment connecting (8, 133) to (272, 169).
; PLAN: r0=8(x1), r1=133(y1), r2=272(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 133
LDI r2, 272
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
