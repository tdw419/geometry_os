; DESCRIPTION: Composite: Places a cyan circle of radius 75 at center (198, 126) then Places a magenta 35x112 rectangle at position (444, 105).
; PLAN: r0=198(x), r1=126(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=105(y), r7=35(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 126
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 105
LDI r7, 35
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
