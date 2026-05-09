; DESCRIPTION: Renders a cyan line between points (134, 196) and (65, 124).
; PLAN: r0=134(x1), r1=196(y1), r2=65(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 196
LDI r2, 65
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
