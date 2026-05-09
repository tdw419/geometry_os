; DESCRIPTION: Renders a white line between points (264, 210) and (168, 89).
; PLAN: r0=264(x1), r1=210(y1), r2=168(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 210
LDI r2, 168
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
