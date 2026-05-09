; DESCRIPTION: Composite: Renders a cyan box of size 63x36 starting at (12, 82) then Places a magenta circle of radius 17 at center (454, 168).
; PLAN: r0=12(x), r1=82(y), r2=63(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=168(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 82
LDI r2, 63
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 168
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
