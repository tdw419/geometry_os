; DESCRIPTION: Renders a cyan line between points (294, 69) and (134, 116).
; PLAN: r0=294(x1), r1=69(y1), r2=134(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 69
LDI r2, 134
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
