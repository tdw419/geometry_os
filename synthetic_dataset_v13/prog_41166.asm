; DESCRIPTION: Composite: Renders a magenta disk with center (33, 89) and radius 25 then Places a orange 86x62 rectangle at position (420, 142).
; PLAN: r0=33(x), r1=89(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=142(y), r7=86(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 89
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 142
LDI r7, 86
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
