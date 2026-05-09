; DESCRIPTION: Composite: Renders a cyan box of size 86x76 starting at (244, 168) then Places a magenta circle of radius 31 at center (323, 53).
; PLAN: r0=244(x), r1=168(y), r2=86(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=53(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 244
LDI r1, 168
LDI r2, 86
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 53
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
