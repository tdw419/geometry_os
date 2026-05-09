; DESCRIPTION: Places a red line segment connecting (40, 221) to (195, 134).
; PLAN: r0=40(x1), r1=221(y1), r2=195(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 221
LDI r2, 195
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
