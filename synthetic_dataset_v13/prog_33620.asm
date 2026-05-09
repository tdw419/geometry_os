; DESCRIPTION: Composite: Places a green 90x19 rectangle at position (334, 129) then Places a red circle of radius 71 at center (357, 180).
; PLAN: r0=334(x), r1=129(y), r2=90(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=180(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 334
LDI r1, 129
LDI r2, 90
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 180
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
