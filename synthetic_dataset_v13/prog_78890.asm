; DESCRIPTION: Composite: Places a white dot at position (414, 197) then Places a blue line segment connecting (120, 39) to (299, 109).
; PLAN: r0=414(x), r1=197(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=120(x1), r6=39(y1), r7=299(x2), r8=109(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 197
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 120
LDI r6, 39
LDI r7, 299
LDI r8, 109
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
