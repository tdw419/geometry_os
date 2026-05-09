; DESCRIPTION: Renders a white line between points (278, 79) and (352, 27).
; PLAN: r0=278(x1), r1=79(y1), r2=352(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 79
LDI r2, 352
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
