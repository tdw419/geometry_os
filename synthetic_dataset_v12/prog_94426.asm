; DESCRIPTION: Composite: Creates a magenta circular shape at (335, 129) with radius 66 then Places a yellow 70x41 rectangle at position (415, 4).
; PLAN: r0=335(x), r1=129(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x), r6=4(y), r7=70(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 129
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 4
LDI r7, 70
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
