; DESCRIPTION: Renders a white line between points (482, 50) and (40, 33).
; PLAN: r0=482(x1), r1=50(y1), r2=40(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 50
LDI r2, 40
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
