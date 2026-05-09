; DESCRIPTION: Places a cyan line segment connecting (206, 156) to (60, 153).
; PLAN: r0=206(x1), r1=156(y1), r2=60(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 156
LDI r2, 60
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
