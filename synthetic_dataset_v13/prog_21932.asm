; DESCRIPTION: Composite: Draws a blue rectangle at (454, 68) with width 12 and height 82 then Places a red dot at position (206, 148).
; PLAN: r0=454(x), r1=68(y), r2=12(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=148(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 68
LDI r2, 12
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 148
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
