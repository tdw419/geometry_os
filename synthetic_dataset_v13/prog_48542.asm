; DESCRIPTION: Composite: Creates a white circular shape at (218, 90) with radius 57 then Draws a red rectangle at (294, 134) with width 95 and height 117.
; PLAN: r0=218(x), r1=90(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=134(y), r7=95(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 90
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 134
LDI r7, 95
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
