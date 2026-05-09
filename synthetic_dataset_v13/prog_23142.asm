; DESCRIPTION: Composite: Creates a cyan circular shape at (255, 46) with radius 41 then Places a red 115x46 rectangle at position (70, 36).
; PLAN: r0=255(x), r1=46(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=36(y), r7=115(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 46
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 36
LDI r7, 115
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
