; DESCRIPTION: Places a cyan line segment connecting (154, 80) to (70, 34).
; PLAN: r0=154(x1), r1=80(y1), r2=70(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 80
LDI r2, 70
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
