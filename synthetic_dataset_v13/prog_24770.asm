; DESCRIPTION: Composite: Places a white dot at position (479, 224) then Creates a magenta rectangular region at (70, 203) spanning 72 by 20 pixels.
; PLAN: r0=479(x), r1=224(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=203(y), r7=72(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 224
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 70
LDI r6, 203
LDI r7, 72
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
