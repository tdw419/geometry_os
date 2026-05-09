; DESCRIPTION: Composite: Places a white line segment connecting (394, 75) to (186, 206) then Places a red dot at position (501, 29).
; PLAN: r0=394(x1), r1=75(y1), r2=186(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=501(x), r6=29(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 75
LDI r2, 186
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 29
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
