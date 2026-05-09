; DESCRIPTION: Places a cyan line segment connecting (181, 40) to (346, 179).
; PLAN: r0=181(x1), r1=40(y1), r2=346(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 40
LDI r2, 346
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
