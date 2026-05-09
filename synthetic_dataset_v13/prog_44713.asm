; DESCRIPTION: Composite: Places a white dot at position (384, 176) then Renders a blue line between points (308, 116) and (266, 178).
; PLAN: r0=384(x), r1=176(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=308(x1), r6=116(y1), r7=266(x2), r8=178(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 176
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 308
LDI r6, 116
LDI r7, 266
LDI r8, 178
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
