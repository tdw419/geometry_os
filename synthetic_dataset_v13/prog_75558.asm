; DESCRIPTION: Renders a cyan line between points (382, 200) and (220, 6).
; PLAN: r0=382(x1), r1=200(y1), r2=220(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 200
LDI r2, 220
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
