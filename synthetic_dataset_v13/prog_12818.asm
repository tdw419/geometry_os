; DESCRIPTION: Places a yellow line segment connecting (290, 255) to (488, 50).
; PLAN: r0=290(x1), r1=255(y1), r2=488(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 255
LDI r2, 488
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
