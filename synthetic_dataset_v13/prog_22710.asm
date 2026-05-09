; DESCRIPTION: Renders a white line between points (24, 72) and (352, 50).
; PLAN: r0=24(x1), r1=72(y1), r2=352(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 72
LDI r2, 352
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
