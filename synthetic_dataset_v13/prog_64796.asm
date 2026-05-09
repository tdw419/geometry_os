; DESCRIPTION: Composite: Creates a red circular shape at (300, 119) with radius 78 then Places a green 29x27 rectangle at position (255, 168).
; PLAN: r0=300(x), r1=119(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=168(y), r7=29(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 119
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 168
LDI r7, 29
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
