; DESCRIPTION: Composite: Draws a orange circle centered at (251, 100) with radius 59 then Places a cyan 74x104 rectangle at position (422, 60).
; PLAN: r0=251(x), r1=100(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=60(y), r7=74(width), r8=104(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 100
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 60
LDI r7, 74
LDI r8, 104
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
