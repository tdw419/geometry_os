; DESCRIPTION: Composite: Places a white circle of radius 16 at center (94, 69) then Places a yellow 36x69 rectangle at position (370, 11).
; PLAN: r0=94(x), r1=69(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=11(y), r7=36(width), r8=69(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 69
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 11
LDI r7, 36
LDI r8, 69
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
