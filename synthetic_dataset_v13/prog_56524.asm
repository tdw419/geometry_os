; DESCRIPTION: Composite: Renders a cyan box of size 66x113 starting at (231, 29) then Renders a black disk with center (159, 141) and radius 79 then Places a cyan dot at position (323, 92).
; PLAN: r0=231(x), r1=29(y), r2=66(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x), r6=141(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x), r11=92(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 29
LDI r2, 66
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 141
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 92
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
