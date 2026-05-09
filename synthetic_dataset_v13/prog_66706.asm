; DESCRIPTION: Composite: Places a orange 54x22 rectangle at position (315, 10) then Creates a black circular shape at (150, 221) with radius 25.
; PLAN: r0=315(x), r1=10(y), r2=54(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=221(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 315
LDI r1, 10
LDI r2, 54
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 221
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
