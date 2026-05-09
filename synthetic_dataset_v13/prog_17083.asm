; DESCRIPTION: Composite: Draws a green circle centered at (259, 51) with radius 34 then Places a magenta 40x57 rectangle at position (471, 193).
; PLAN: r0=259(x), r1=51(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=471(x), r6=193(y), r7=40(width), r8=57(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 51
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 471
LDI r6, 193
LDI r7, 40
LDI r8, 57
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
