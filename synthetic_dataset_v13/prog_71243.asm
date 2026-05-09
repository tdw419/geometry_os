; DESCRIPTION: Composite: Places a red 30x77 rectangle at position (366, 114) then Places a yellow circle of radius 10 at center (451, 103).
; PLAN: r0=366(x), r1=114(y), r2=30(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=451(x), r6=103(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 114
LDI r2, 30
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 451
LDI r6, 103
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
