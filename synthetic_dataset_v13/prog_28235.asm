; DESCRIPTION: Composite: Draws a orange circle centered at (77, 190) with radius 54 then Places a cyan 30x105 rectangle at position (479, 33).
; PLAN: r0=77(x), r1=190(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x), r6=33(y), r7=30(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 190
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 33
LDI r7, 30
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
