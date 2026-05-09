; DESCRIPTION: Composite: Creates a white rectangular region at (12, 100) spanning 81 by 68 pixels then Places a cyan circle of radius 28 at center (374, 57).
; PLAN: r0=12(x), r1=100(y), r2=81(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=57(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 100
LDI r2, 81
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 57
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
