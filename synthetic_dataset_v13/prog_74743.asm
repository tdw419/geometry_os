; DESCRIPTION: Renders a green line between points (475, 68) and (291, 240).
; PLAN: r0=475(x1), r1=68(y1), r2=291(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 68
LDI r2, 291
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
