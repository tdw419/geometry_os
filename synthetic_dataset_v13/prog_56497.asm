; DESCRIPTION: Composite: Places a white circle of radius 75 at center (385, 119) then Places a white 74x120 rectangle at position (380, 75).
; PLAN: r0=385(x), r1=119(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=75(y), r7=74(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 119
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 75
LDI r7, 74
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
