; DESCRIPTION: Composite: Places a magenta 18x31 rectangle at position (153, 41) then Renders a cyan disk with center (335, 94) and radius 47.
; PLAN: r0=153(x), r1=41(y), r2=18(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x), r6=94(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 153
LDI r1, 41
LDI r2, 18
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 94
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
