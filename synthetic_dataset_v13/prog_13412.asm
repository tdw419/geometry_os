; DESCRIPTION: Places a green line segment connecting (450, 173) to (475, 222).
; PLAN: r0=450(x1), r1=173(y1), r2=475(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 173
LDI r2, 475
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
