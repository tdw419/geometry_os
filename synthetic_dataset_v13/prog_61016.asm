; DESCRIPTION: Renders a cyan line between points (475, 21) and (450, 145).
; PLAN: r0=475(x1), r1=21(y1), r2=450(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 21
LDI r2, 450
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
