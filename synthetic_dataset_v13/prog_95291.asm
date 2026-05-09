; DESCRIPTION: Places a red line segment connecting (288, 249) to (288, 146).
; PLAN: r0=288(x1), r1=249(y1), r2=288(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 249
LDI r2, 288
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
