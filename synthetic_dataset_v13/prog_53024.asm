; DESCRIPTION: Places a blue line segment connecting (346, 213) to (179, 95).
; PLAN: r0=346(x1), r1=213(y1), r2=179(x2), r3=95(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 213
LDI r2, 179
LDI r3, 95
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
