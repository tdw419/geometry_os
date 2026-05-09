; DESCRIPTION: Renders a cyan line between points (47, 1) and (382, 125).
; PLAN: r0=47(x1), r1=1(y1), r2=382(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 1
LDI r2, 382
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
