; DESCRIPTION: Composite: Places a blue dot at position (162, 135) then Draws a cyan rectangle at (408, 48) with width 39 and height 79.
; PLAN: r0=162(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=48(y), r7=39(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 48
LDI r7, 39
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
