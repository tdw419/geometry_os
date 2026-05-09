; DESCRIPTION: Renders a black line between points (213, 149) and (199, 178).
; PLAN: r0=213(x1), r1=149(y1), r2=199(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 149
LDI r2, 199
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
