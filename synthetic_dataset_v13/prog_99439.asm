; DESCRIPTION: Places a white line segment connecting (336, 75) to (459, 213).
; PLAN: r0=336(x1), r1=75(y1), r2=459(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 75
LDI r2, 459
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
