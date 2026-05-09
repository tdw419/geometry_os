; DESCRIPTION: Renders a cyan line between points (79, 75) and (285, 108).
; PLAN: r0=79(x1), r1=75(y1), r2=285(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 75
LDI r2, 285
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
