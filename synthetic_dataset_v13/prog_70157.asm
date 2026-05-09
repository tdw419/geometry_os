; DESCRIPTION: Renders a blue line between points (193, 146) and (251, 228).
; PLAN: r0=193(x1), r1=146(y1), r2=251(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 146
LDI r2, 251
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
