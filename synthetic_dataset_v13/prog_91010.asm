; DESCRIPTION: Composite: Places a magenta 111x21 rectangle at position (247, 198) then Places a green circle of radius 48 at center (272, 208).
; PLAN: r0=247(x), r1=198(y), r2=111(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=208(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 198
LDI r2, 111
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 208
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
