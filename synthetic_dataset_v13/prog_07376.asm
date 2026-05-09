; DESCRIPTION: Composite: Places a magenta circle of radius 53 at center (186, 108) then Renders a black box of size 30x50 starting at (44, 93).
; PLAN: r0=186(x), r1=108(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=93(y), r7=30(width), r8=50(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 108
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 93
LDI r7, 30
LDI r8, 50
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
