; DESCRIPTION: Composite: Places a green circle of radius 73 at center (383, 155) then Places a yellow 56x107 rectangle at position (150, 27).
; PLAN: r0=383(x), r1=155(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=27(y), r7=56(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 155
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 27
LDI r7, 56
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
