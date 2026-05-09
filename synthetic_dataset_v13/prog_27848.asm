; DESCRIPTION: Composite: Places a cyan 81x17 rectangle at position (16, 66) then Places a blue dot at position (264, 17).
; PLAN: r0=16(x), r1=66(y), r2=81(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=264(x), r6=17(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 16
LDI r1, 66
LDI r2, 81
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 17
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
