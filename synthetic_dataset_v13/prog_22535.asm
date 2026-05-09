; DESCRIPTION: Composite: Creates a cyan circular shape at (370, 158) with radius 59 then Places a red 96x34 rectangle at position (188, 187).
; PLAN: r0=370(x), r1=158(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=187(y), r7=96(width), r8=34(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 158
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 187
LDI r7, 96
LDI r8, 34
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
