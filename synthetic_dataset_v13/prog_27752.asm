; DESCRIPTION: Places a red line segment connecting (82, 3) to (435, 215).
; PLAN: r0=82(x1), r1=3(y1), r2=435(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 3
LDI r2, 435
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
