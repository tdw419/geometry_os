; DESCRIPTION: Places a cyan line segment connecting (346, 72) to (246, 162).
; PLAN: r0=346(x1), r1=72(y1), r2=246(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 72
LDI r2, 246
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
