; DESCRIPTION: Renders a green line between points (370, 135) and (380, 7).
; PLAN: r0=370(x1), r1=135(y1), r2=380(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 135
LDI r2, 380
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
