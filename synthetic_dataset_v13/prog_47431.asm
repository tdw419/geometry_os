; DESCRIPTION: Places a white line segment connecting (264, 240) to (450, 29).
; PLAN: r0=264(x1), r1=240(y1), r2=450(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 240
LDI r2, 450
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
