; DESCRIPTION: Renders a cyan line between points (125, 200) and (492, 86).
; PLAN: r0=125(x1), r1=200(y1), r2=492(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 200
LDI r2, 492
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
