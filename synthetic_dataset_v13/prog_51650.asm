; DESCRIPTION: Composite: Renders a magenta disk with center (425, 79) and radius 39 then Renders a cyan box of size 105x88 starting at (355, 120).
; PLAN: r0=425(x), r1=79(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=120(y), r7=105(width), r8=88(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 79
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 120
LDI r7, 105
LDI r8, 88
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
