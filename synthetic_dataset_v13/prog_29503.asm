; DESCRIPTION: Renders a black line between points (398, 143) and (118, 209).
; PLAN: r0=398(x1), r1=143(y1), r2=118(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 143
LDI r2, 118
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
