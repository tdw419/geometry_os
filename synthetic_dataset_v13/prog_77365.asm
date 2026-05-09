; DESCRIPTION: Composite: Places a black dot at position (280, 112) then Draws a purple rectangle at (169, 171) with width 25 and height 72.
; PLAN: r0=280(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=171(y), r7=25(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 112
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 169
LDI r6, 171
LDI r7, 25
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
