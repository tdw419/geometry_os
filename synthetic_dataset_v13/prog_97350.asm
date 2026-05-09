; DESCRIPTION: Composite: Places a magenta circle of radius 52 at center (406, 170) then Places a white 92x105 rectangle at position (107, 107).
; PLAN: r0=406(x), r1=170(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=107(y), r7=92(width), r8=105(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 170
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 107
LDI r7, 92
LDI r8, 105
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
