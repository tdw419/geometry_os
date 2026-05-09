; DESCRIPTION: Renders a cyan line between points (125, 87) and (275, 57).
; PLAN: r0=125(x1), r1=87(y1), r2=275(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 87
LDI r2, 275
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
