; DESCRIPTION: Composite: Places a red 47x106 rectangle at position (36, 19) then Places a yellow circle of radius 78 at center (406, 87).
; PLAN: r0=36(x), r1=19(y), r2=47(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x), r6=87(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 19
LDI r2, 47
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 87
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
