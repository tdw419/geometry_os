; DESCRIPTION: Places a green line segment connecting (346, 100) to (206, 198).
; PLAN: r0=346(x1), r1=100(y1), r2=206(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 100
LDI r2, 206
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
