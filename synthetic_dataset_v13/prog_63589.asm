; DESCRIPTION: Renders a red line between points (25, 210) and (69, 125).
; PLAN: r0=25(x1), r1=210(y1), r2=69(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 210
LDI r2, 69
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
