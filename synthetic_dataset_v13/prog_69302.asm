; DESCRIPTION: Composite: Places a purple 22x10 rectangle at position (75, 25) then Places a red circle of radius 23 at center (245, 116).
; PLAN: r0=75(x), r1=25(y), r2=22(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=116(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 75
LDI r1, 25
LDI r2, 22
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 116
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
