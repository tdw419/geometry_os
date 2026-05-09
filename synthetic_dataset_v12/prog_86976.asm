; DESCRIPTION: Composite: Places a orange circle of radius 59 at center (274, 193) then Places a cyan 109x84 rectangle at position (246, 93).
; PLAN: r0=274(x), r1=193(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=93(y), r7=109(width), r8=84(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 193
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 93
LDI r7, 109
LDI r8, 84
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
