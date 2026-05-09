; DESCRIPTION: Renders a cyan line between points (340, 171) and (134, 233).
; PLAN: r0=340(x1), r1=171(y1), r2=134(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 171
LDI r2, 134
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
