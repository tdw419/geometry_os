; DESCRIPTION: Composite: Places a blue dot at position (126, 193) then Creates a yellow rectangular region at (319, 32) spanning 13 by 117 pixels.
; PLAN: r0=126(x), r1=193(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=32(y), r7=13(width), r8=117(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 193
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 32
LDI r7, 13
LDI r8, 117
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
