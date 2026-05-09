; DESCRIPTION: Renders a white line between points (305, 95) and (267, 230).
; PLAN: r0=305(x1), r1=95(y1), r2=267(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 95
LDI r2, 267
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
