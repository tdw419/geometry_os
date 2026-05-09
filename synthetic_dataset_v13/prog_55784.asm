; DESCRIPTION: Places a red line segment connecting (121, 208) to (338, 231).
; PLAN: r0=121(x1), r1=208(y1), r2=338(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 208
LDI r2, 338
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
