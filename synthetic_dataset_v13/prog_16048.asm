; DESCRIPTION: Renders a red line between points (440, 110) and (494, 236).
; PLAN: r0=440(x1), r1=110(y1), r2=494(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 110
LDI r2, 494
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
