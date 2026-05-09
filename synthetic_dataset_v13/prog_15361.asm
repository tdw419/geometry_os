; DESCRIPTION: Renders a cyan line between points (200, 213) and (462, 171).
; PLAN: r0=200(x1), r1=213(y1), r2=462(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 213
LDI r2, 462
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
