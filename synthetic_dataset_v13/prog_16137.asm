; DESCRIPTION: Composite: Sets a single purple pixel at (488, 25) then Creates a blue rectangular region at (107, 136) spanning 36 by 44 pixels.
; PLAN: r0=488(x), r1=25(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=136(y), r7=36(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 488
LDI r1, 25
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 136
LDI r7, 36
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
