; DESCRIPTION: Composite: Renders a magenta disk with center (154, 131) and radius 74 then Creates a cyan rectangular region at (291, 66) spanning 107 by 109 pixels.
; PLAN: r0=154(x), r1=131(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=66(y), r7=107(width), r8=109(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 131
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 66
LDI r7, 107
LDI r8, 109
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
