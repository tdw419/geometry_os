; DESCRIPTION: Composite: Places a red 23x58 rectangle at position (308, 182) then Places a magenta circle of radius 61 at center (94, 181).
; PLAN: r0=308(x), r1=182(y), r2=23(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=181(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 182
LDI r2, 23
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 181
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
