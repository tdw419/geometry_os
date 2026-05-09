; DESCRIPTION: Composite: Creates a cyan circular shape at (202, 150) with radius 24 then Places a cyan 91x63 rectangle at position (282, 21).
; PLAN: r0=202(x), r1=150(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=21(y), r7=91(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 150
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 21
LDI r7, 91
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
