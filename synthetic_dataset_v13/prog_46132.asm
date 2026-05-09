; DESCRIPTION: Composite: Places a cyan circle of radius 42 at center (456, 114) then Renders a green box of size 24x72 starting at (257, 160).
; PLAN: r0=456(x), r1=114(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=160(y), r7=24(width), r8=72(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 114
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 160
LDI r7, 24
LDI r8, 72
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
