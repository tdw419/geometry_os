; DESCRIPTION: Composite: Places a cyan dot at position (467, 212) then Draws a black rectangle at (83, 44) with width 112 and height 36 then Creates a blue circular shape at (171, 124) with radius 69.
; PLAN: r0=467(x), r1=212(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=44(y), r7=112(width), r8=36(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=124(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 467
LDI r1, 212
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 44
LDI r7, 112
LDI r8, 36
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 124
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
