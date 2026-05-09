; DESCRIPTION: Renders a black line between points (464, 113) and (398, 167).
; PLAN: r0=464(x1), r1=113(y1), r2=398(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 113
LDI r2, 398
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
