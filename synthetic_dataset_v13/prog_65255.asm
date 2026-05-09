; DESCRIPTION: Renders a white line between points (37, 37) and (398, 24).
; PLAN: r0=37(x1), r1=37(y1), r2=398(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 37
LDI r2, 398
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
