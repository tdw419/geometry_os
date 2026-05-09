; DESCRIPTION: Composite: Creates a magenta rectangular region at (402, 108) spanning 27 by 11 pixels then Places a white dot at position (288, 218).
; PLAN: r0=402(x), r1=108(y), r2=27(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=218(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 108
LDI r2, 27
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 218
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
