; DESCRIPTION: Composite: Places a cyan 23x23 rectangle at position (286, 82) then Places a black circle of radius 13 at center (186, 163).
; PLAN: r0=286(x), r1=82(y), r2=23(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=163(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 82
LDI r2, 23
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 163
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
