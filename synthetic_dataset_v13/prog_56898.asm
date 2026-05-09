; DESCRIPTION: Composite: Renders a green disk with center (125, 193) and radius 48 then Places a blue 64x14 rectangle at position (66, 111).
; PLAN: r0=125(x), r1=193(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=111(y), r7=64(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 193
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 111
LDI r7, 64
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
