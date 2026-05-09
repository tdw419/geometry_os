; DESCRIPTION: Renders a orange line between points (206, 247) and (193, 177).
; PLAN: r0=206(x1), r1=247(y1), r2=193(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 247
LDI r2, 193
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
