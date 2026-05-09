; DESCRIPTION: Renders a red line between points (16, 226) and (476, 125).
; PLAN: r0=16(x1), r1=226(y1), r2=476(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 226
LDI r2, 476
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
