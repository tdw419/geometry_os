; DESCRIPTION: Renders a white line between points (39, 210) and (295, 118).
; PLAN: r0=39(x1), r1=210(y1), r2=295(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 210
LDI r2, 295
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
