; DESCRIPTION: Composite: Places a purple dot at position (398, 121) then Draws a white rectangle at (80, 80) with width 89 and height 96.
; PLAN: r0=398(x), r1=121(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=80(y), r7=89(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 121
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 80
LDI r7, 89
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
