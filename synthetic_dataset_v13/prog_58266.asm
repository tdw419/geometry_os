; DESCRIPTION: Renders a white line between points (401, 106) and (138, 166).
; PLAN: r0=401(x1), r1=106(y1), r2=138(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 106
LDI r2, 138
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
