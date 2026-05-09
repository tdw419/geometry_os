; DESCRIPTION: Composite: Places a white circle of radius 65 at center (226, 167) then Renders a cyan box of size 62x61 starting at (88, 52).
; PLAN: r0=226(x), r1=167(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=52(y), r7=62(width), r8=61(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 167
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 52
LDI r7, 62
LDI r8, 61
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
