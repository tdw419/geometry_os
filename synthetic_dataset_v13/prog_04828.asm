; DESCRIPTION: Renders a white line between points (187, 246) and (507, 95).
; PLAN: r0=187(x1), r1=246(y1), r2=507(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 246
LDI r2, 507
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
