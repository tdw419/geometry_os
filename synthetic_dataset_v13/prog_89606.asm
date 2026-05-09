; DESCRIPTION: Renders a red line between points (228, 79) and (197, 132).
; PLAN: r0=228(x1), r1=79(y1), r2=197(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 79
LDI r2, 197
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
