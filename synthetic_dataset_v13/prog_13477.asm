; DESCRIPTION: Composite: Renders a white line between points (123, 150) and (416, 49) then Places a red dot at position (45, 95).
; PLAN: r0=123(x1), r1=150(y1), r2=416(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=95(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 123
LDI r1, 150
LDI r2, 416
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 95
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
