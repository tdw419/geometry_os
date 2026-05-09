; DESCRIPTION: Composite: Creates a magenta circular shape at (391, 166) with radius 24 then Places a white 27x98 rectangle at position (346, 39) then Places a yellow dot at position (216, 43).
; PLAN: r0=391(x), r1=166(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=39(y), r7=27(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x), r11=43(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 166
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 39
LDI r7, 27
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 43
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
