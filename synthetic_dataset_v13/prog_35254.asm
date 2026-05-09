; DESCRIPTION: Renders a cyan line between points (244, 148) and (298, 81).
; PLAN: r0=244(x1), r1=148(y1), r2=298(x2), r3=81(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 148
LDI r2, 298
LDI r3, 81
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
