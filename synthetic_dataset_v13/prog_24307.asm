; DESCRIPTION: Composite: Places a blue dot at position (317, 34) then Draws a blue rectangle at (210, 25) with width 120 and height 70.
; PLAN: r0=317(x), r1=34(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=25(y), r7=120(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 34
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 210
LDI r6, 25
LDI r7, 120
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
