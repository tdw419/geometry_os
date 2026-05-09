; DESCRIPTION: Renders a cyan line between points (120, 85) and (360, 69).
; PLAN: r0=120(x1), r1=85(y1), r2=360(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 85
LDI r2, 360
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
