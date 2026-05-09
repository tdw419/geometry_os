; DESCRIPTION: Composite: Renders a cyan disk with center (417, 97) and radius 13 then Places a purple 86x59 rectangle at position (363, 32).
; PLAN: r0=417(x), r1=97(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=32(y), r7=86(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 97
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 32
LDI r7, 86
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
