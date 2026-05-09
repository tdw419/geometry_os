; DESCRIPTION: Renders a cyan line between points (365, 90) and (18, 165).
; PLAN: r0=365(x1), r1=90(y1), r2=18(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 90
LDI r2, 18
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
