; DESCRIPTION: Composite: Places a black 47x83 rectangle at position (365, 162) then Renders a orange disk with center (129, 82) and radius 32.
; PLAN: r0=365(x), r1=162(y), r2=47(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=82(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 162
LDI r2, 47
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 82
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
