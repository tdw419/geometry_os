; DESCRIPTION: Places a cyan line segment connecting (416, 221) to (169, 79).
; PLAN: r0=416(x1), r1=221(y1), r2=169(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 221
LDI r2, 169
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
