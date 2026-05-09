; DESCRIPTION: Composite: Creates a cyan circular shape at (386, 155) with radius 78 then Places a red 16x43 rectangle at position (193, 124).
; PLAN: r0=386(x), r1=155(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=124(y), r7=16(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 155
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 124
LDI r7, 16
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
