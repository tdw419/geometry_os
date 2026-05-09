; DESCRIPTION: Composite: Creates a cyan rectangular region at (113, 54) spanning 63 by 21 pixels then Places a yellow dot at position (104, 203).
; PLAN: r0=113(x), r1=54(y), r2=63(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x), r6=203(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 113
LDI r1, 54
LDI r2, 63
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 203
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
