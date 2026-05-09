; DESCRIPTION: Composite: Places a white 64x58 rectangle at position (304, 75) then Places a green dot at position (455, 188).
; PLAN: r0=304(x), r1=75(y), r2=64(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=188(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 75
LDI r2, 64
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 188
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
