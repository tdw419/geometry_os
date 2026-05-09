; DESCRIPTION: Composite: Draws a white rectangle at (13, 57) with width 32 and height 31 then Sets a single cyan pixel at (56, 254).
; PLAN: r0=13(x), r1=57(y), r2=32(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=254(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 13
LDI r1, 57
LDI r2, 32
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 254
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
