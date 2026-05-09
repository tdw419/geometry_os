; DESCRIPTION: Renders a red line between points (313, 42) and (464, 36).
; PLAN: r0=313(x1), r1=42(y1), r2=464(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 42
LDI r2, 464
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
