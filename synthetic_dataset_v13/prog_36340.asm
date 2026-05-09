; DESCRIPTION: Composite: Sets a single black pixel at (360, 10) then Places a yellow line segment connecting (184, 68) to (59, 246).
; PLAN: r0=360(x), r1=10(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=68(y1), r7=59(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 10
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 184
LDI r6, 68
LDI r7, 59
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
