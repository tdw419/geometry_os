; DESCRIPTION: Places a red line segment connecting (243, 120) to (347, 42).
; PLAN: r0=243(x1), r1=120(y1), r2=347(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 120
LDI r2, 347
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
