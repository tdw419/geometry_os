; DESCRIPTION: Renders a red line between points (238, 206) and (386, 79).
; PLAN: r0=238(x1), r1=206(y1), r2=386(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 206
LDI r2, 386
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
