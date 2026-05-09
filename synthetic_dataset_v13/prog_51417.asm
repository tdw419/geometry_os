; DESCRIPTION: Renders a green line between points (226, 221) and (102, 48).
; PLAN: r0=226(x1), r1=221(y1), r2=102(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 221
LDI r2, 102
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
