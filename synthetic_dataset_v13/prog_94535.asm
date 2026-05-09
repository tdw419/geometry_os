; DESCRIPTION: Renders a black line between points (249, 39) and (59, 255).
; PLAN: r0=249(x1), r1=39(y1), r2=59(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 39
LDI r2, 59
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
