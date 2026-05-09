; DESCRIPTION: Places a red line segment connecting (179, 1) to (224, 146).
; PLAN: r0=179(x1), r1=1(y1), r2=224(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 1
LDI r2, 224
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
