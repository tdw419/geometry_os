; DESCRIPTION: Renders a cyan line between points (125, 4) and (113, 200).
; PLAN: r0=125(x1), r1=4(y1), r2=113(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 4
LDI r2, 113
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
