; DESCRIPTION: Composite: Places a black 64x57 rectangle at position (242, 106) then Places a green dot at position (282, 66).
; PLAN: r0=242(x), r1=106(y), r2=64(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=66(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 106
LDI r2, 64
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 66
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
