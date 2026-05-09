; DESCRIPTION: Renders a orange line between points (354, 215) and (342, 220).
; PLAN: r0=354(x1), r1=215(y1), r2=342(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 215
LDI r2, 342
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
