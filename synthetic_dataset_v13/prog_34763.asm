; DESCRIPTION: Composite: Renders a cyan disk with center (167, 145) and radius 37 then Creates a red rectangular region at (60, 97) spanning 57 by 57 pixels.
; PLAN: r0=167(x), r1=145(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=97(y), r7=57(width), r8=57(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 145
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 97
LDI r7, 57
LDI r8, 57
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
