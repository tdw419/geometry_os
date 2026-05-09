; DESCRIPTION: Composite: Renders a black disk with center (385, 97) and radius 64 then Places a cyan 36x17 rectangle at position (344, 180).
; PLAN: r0=385(x), r1=97(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=180(y), r7=36(width), r8=17(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 97
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 180
LDI r7, 36
LDI r8, 17
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
