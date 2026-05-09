; DESCRIPTION: Renders a black line between points (502, 197) and (504, 255).
; PLAN: r0=502(x1), r1=197(y1), r2=504(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 197
LDI r2, 504
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
