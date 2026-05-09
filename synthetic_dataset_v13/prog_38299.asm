; DESCRIPTION: Composite: Renders a cyan box of size 66x105 starting at (392, 59) then Places a black circle of radius 41 at center (111, 107) then Places a red dot at position (195, 0).
; PLAN: r0=392(x), r1=59(y), r2=66(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=107(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=0(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 59
LDI r2, 66
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 107
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 0
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
