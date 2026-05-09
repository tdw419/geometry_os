; DESCRIPTION: Places a red line segment connecting (180, 150) to (419, 215).
; PLAN: r0=180(x1), r1=150(y1), r2=419(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 150
LDI r2, 419
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
