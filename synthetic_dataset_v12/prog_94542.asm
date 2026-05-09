; DESCRIPTION: Composite: Places a green dot at position (476, 152) then Draws a blue rectangle at (149, 58) with width 98 and height 56.
; PLAN: r0=476(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=58(y), r7=98(width), r8=56(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 476
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 149
LDI r6, 58
LDI r7, 98
LDI r8, 56
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
