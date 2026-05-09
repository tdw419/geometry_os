; DESCRIPTION: Renders a cyan line between points (125, 5) and (56, 76).
; PLAN: r0=125(x1), r1=5(y1), r2=56(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 5
LDI r2, 56
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
