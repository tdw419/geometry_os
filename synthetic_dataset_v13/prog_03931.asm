; DESCRIPTION: Composite: Creates a purple circular shape at (227, 119) with radius 20 then Renders a white box of size 66x19 starting at (411, 71) then Places a magenta dot at position (413, 146).
; PLAN: r0=227(x), r1=119(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x), r6=71(y), r7=66(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=146(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 227
LDI r1, 119
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 71
LDI r7, 66
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 146
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
