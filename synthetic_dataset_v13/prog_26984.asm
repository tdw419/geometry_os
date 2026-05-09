; DESCRIPTION: Renders a white line between points (376, 215) and (57, 240).
; PLAN: r0=376(x1), r1=215(y1), r2=57(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 215
LDI r2, 57
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
