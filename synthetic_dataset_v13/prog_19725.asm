; DESCRIPTION: Renders a cyan line between points (311, 27) and (18, 230).
; PLAN: r0=311(x1), r1=27(y1), r2=18(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 27
LDI r2, 18
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
