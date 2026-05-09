; DESCRIPTION: Composite: Places a green 60x39 rectangle at position (23, 104) then Renders a white disk with center (278, 111) and radius 52.
; PLAN: r0=23(x), r1=104(y), r2=60(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x), r6=111(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 104
LDI r2, 60
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 111
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
