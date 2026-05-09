; DESCRIPTION: Places a white line segment connecting (394, 221) to (120, 93).
; PLAN: r0=394(x1), r1=221(y1), r2=120(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 221
LDI r2, 120
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
