; DESCRIPTION: Renders a cyan line between points (116, 95) and (403, 194).
; PLAN: r0=116(x1), r1=95(y1), r2=403(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 95
LDI r2, 403
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
