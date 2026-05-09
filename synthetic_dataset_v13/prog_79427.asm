; DESCRIPTION: Places a cyan line segment connecting (276, 162) to (346, 7).
; PLAN: r0=276(x1), r1=162(y1), r2=346(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 162
LDI r2, 346
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
