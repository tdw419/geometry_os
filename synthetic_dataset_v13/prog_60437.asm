; DESCRIPTION: Composite: Places a white line segment connecting (263, 85) to (174, 29) then Places a white dot at position (416, 69).
; PLAN: r0=263(x1), r1=85(y1), r2=174(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=69(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 85
LDI r2, 174
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 69
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
