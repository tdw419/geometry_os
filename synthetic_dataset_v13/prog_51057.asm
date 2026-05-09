; DESCRIPTION: Composite: Renders a red disk with center (147, 111) and radius 64 then Renders a purple box of size 12x71 starting at (374, 96) then Places a red dot at position (383, 197).
; PLAN: r0=147(x), r1=111(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=96(y), r7=12(width), r8=71(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=383(x), r11=197(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 147
LDI r1, 111
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 96
LDI r7, 12
LDI r8, 71
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 383
LDI r11, 197
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
