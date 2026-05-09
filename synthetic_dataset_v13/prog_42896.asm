; DESCRIPTION: Composite: Places a cyan circle of radius 74 at center (236, 129) then Places a black 64x19 rectangle at position (254, 75).
; PLAN: r0=236(x), r1=129(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=75(y), r7=64(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 129
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 75
LDI r7, 64
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
