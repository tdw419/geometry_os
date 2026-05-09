; DESCRIPTION: Composite: Places a blue 78x54 rectangle at position (238, 37) then Places a white dot at position (52, 91).
; PLAN: r0=238(x), r1=37(y), r2=78(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=91(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 238
LDI r1, 37
LDI r2, 78
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 91
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
