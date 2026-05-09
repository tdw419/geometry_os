; DESCRIPTION: Composite: Renders a magenta disk with center (324, 118) and radius 30 then Places a blue 41x48 rectangle at position (315, 87).
; PLAN: r0=324(x), r1=118(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x), r6=87(y), r7=41(width), r8=48(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 118
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 87
LDI r7, 41
LDI r8, 48
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
