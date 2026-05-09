; DESCRIPTION: Composite: Places a white dot at position (256, 128) then Creates a blue rectangular region at (455, 145) spanning 27 by 15 pixels.
; PLAN: r0=256(x), r1=128(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=455(x), r6=145(y), r7=27(width), r8=15(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 128
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 455
LDI r6, 145
LDI r7, 27
LDI r8, 15
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
