; DESCRIPTION: Composite: Places a purple 26x64 rectangle at position (382, 54) then Sets a single cyan pixel at (405, 155).
; PLAN: r0=382(x), r1=54(y), r2=26(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=155(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 382
LDI r1, 54
LDI r2, 26
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 155
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
