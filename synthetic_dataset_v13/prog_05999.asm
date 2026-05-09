; DESCRIPTION: Composite: Renders a purple disk with center (380, 107) and radius 65 then Places a white 73x66 rectangle at position (332, 127).
; PLAN: r0=380(x), r1=107(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=127(y), r7=73(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 107
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 127
LDI r7, 73
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
