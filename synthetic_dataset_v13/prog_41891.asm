; DESCRIPTION: Renders a cyan line between points (442, 163) and (79, 31).
; PLAN: r0=442(x1), r1=163(y1), r2=79(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 163
LDI r2, 79
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
