; DESCRIPTION: Renders a black line between points (308, 149) and (143, 213).
; PLAN: r0=308(x1), r1=149(y1), r2=143(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 149
LDI r2, 143
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
