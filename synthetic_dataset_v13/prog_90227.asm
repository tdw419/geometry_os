; DESCRIPTION: Places a red line segment connecting (271, 215) to (75, 250).
; PLAN: r0=271(x1), r1=215(y1), r2=75(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 215
LDI r2, 75
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
