; DESCRIPTION: Composite: Places a red 70x60 rectangle at position (205, 119) then Places a blue circle of radius 75 at center (171, 107).
; PLAN: r0=205(x), r1=119(y), r2=70(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=107(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 119
LDI r2, 70
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 107
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
