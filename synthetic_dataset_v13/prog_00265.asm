; DESCRIPTION: Places a cyan line segment connecting (179, 223) to (181, 246).
; PLAN: r0=179(x1), r1=223(y1), r2=181(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 223
LDI r2, 181
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
