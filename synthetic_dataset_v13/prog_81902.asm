; DESCRIPTION: Renders a black line between points (464, 135) and (295, 57).
; PLAN: r0=464(x1), r1=135(y1), r2=295(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 135
LDI r2, 295
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
