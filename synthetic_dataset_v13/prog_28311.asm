; DESCRIPTION: Renders a green line between points (186, 55) and (263, 57).
; PLAN: r0=186(x1), r1=55(y1), r2=263(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 55
LDI r2, 263
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
