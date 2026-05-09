; DESCRIPTION: Renders a black line between points (310, 173) and (498, 186).
; PLAN: r0=310(x1), r1=173(y1), r2=498(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 173
LDI r2, 498
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
