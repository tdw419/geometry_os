; DESCRIPTION: Renders a red line between points (210, 116) and (215, 64).
; PLAN: r0=210(x1), r1=116(y1), r2=215(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 116
LDI r2, 215
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
