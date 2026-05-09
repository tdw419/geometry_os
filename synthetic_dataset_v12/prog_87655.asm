; DESCRIPTION: Composite: Places a magenta circle of radius 36 at center (466, 47) then Places a blue 54x99 rectangle at position (382, 31) then Sets a single cyan pixel at (84, 254).
; PLAN: r0=466(x), r1=47(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=31(y), r7=54(width), r8=99(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x), r11=254(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 466
LDI r1, 47
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 31
LDI r7, 54
LDI r8, 99
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 254
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
