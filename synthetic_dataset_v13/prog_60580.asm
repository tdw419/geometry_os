; DESCRIPTION: Composite: Renders a magenta disk with center (126, 122) and radius 71 then Places a green 107x57 rectangle at position (81, 44).
; PLAN: r0=126(x), r1=122(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x), r6=44(y), r7=107(width), r8=57(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 122
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 44
LDI r7, 107
LDI r8, 57
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
