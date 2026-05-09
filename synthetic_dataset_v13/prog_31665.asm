; DESCRIPTION: Composite: Sets a single red pixel at (442, 108) then Creates a blue rectangular region at (207, 107) spanning 58 by 111 pixels.
; PLAN: r0=442(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=107(y), r7=58(width), r8=111(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 207
LDI r6, 107
LDI r7, 58
LDI r8, 111
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
