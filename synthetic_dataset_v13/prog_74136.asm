; DESCRIPTION: Renders a cyan line between points (111, 125) and (37, 210).
; PLAN: r0=111(x1), r1=125(y1), r2=37(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 125
LDI r2, 37
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
