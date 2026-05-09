; DESCRIPTION: Renders a red line between points (452, 221) and (215, 59).
; PLAN: r0=452(x1), r1=221(y1), r2=215(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 221
LDI r2, 215
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
