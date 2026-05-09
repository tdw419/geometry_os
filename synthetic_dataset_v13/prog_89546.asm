; DESCRIPTION: Composite: Places a orange 70x61 rectangle at position (5, 44) then Places a green circle of radius 54 at center (306, 137).
; PLAN: r0=5(x), r1=44(y), r2=70(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=137(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 44
LDI r2, 70
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 137
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
