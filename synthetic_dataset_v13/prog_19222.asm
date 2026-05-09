; DESCRIPTION: Places a red line segment connecting (51, 173) to (165, 231).
; PLAN: r0=51(x1), r1=173(y1), r2=165(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 173
LDI r2, 165
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
