; DESCRIPTION: Renders a cyan line between points (477, 34) and (50, 125).
; PLAN: r0=477(x1), r1=34(y1), r2=50(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 34
LDI r2, 50
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
