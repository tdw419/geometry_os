; DESCRIPTION: Composite: Renders a red disk with center (437, 60) and radius 10 then Renders a cyan box of size 97x71 starting at (177, 31) then Places a purple dot at position (151, 3).
; PLAN: r0=437(x), r1=60(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=31(y), r7=97(width), r8=71(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=151(x), r11=3(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 437
LDI r1, 60
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 31
LDI r7, 97
LDI r8, 71
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 3
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
