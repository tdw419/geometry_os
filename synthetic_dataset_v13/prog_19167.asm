; DESCRIPTION: Composite: Creates a white circular shape at (317, 129) with radius 61 then Draws a red rectangle at (174, 51) with width 18 and height 68.
; PLAN: r0=317(x), r1=129(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=51(y), r7=18(width), r8=68(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 129
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 51
LDI r7, 18
LDI r8, 68
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
