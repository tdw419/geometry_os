; DESCRIPTION: Renders a orange line between points (305, 39) and (193, 246).
; PLAN: r0=305(x1), r1=39(y1), r2=193(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 39
LDI r2, 193
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
