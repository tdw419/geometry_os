; DESCRIPTION: Renders a red line between points (370, 144) and (445, 63).
; PLAN: r0=370(x1), r1=144(y1), r2=445(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 144
LDI r2, 445
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
