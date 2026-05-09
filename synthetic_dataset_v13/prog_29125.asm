; DESCRIPTION: Composite: Draws a black circle centered at (181, 185) with radius 48 then Places a cyan 106x10 rectangle at position (229, 168).
; PLAN: r0=181(x), r1=185(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=168(y), r7=106(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 185
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 168
LDI r7, 106
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
