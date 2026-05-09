; DESCRIPTION: Renders a cyan line between points (163, 221) and (408, 168).
; PLAN: r0=163(x1), r1=221(y1), r2=408(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 221
LDI r2, 408
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
