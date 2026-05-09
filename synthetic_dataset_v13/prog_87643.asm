; DESCRIPTION: Composite: Places a magenta 73x84 rectangle at position (97, 32) then Places a magenta circle of radius 48 at center (365, 99) then Places a cyan dot at position (508, 128).
; PLAN: r0=97(x), r1=32(y), r2=73(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=99(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=508(x), r11=128(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 97
LDI r1, 32
LDI r2, 73
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 99
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 508
LDI r11, 128
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
