; DESCRIPTION: Composite: Renders a cyan disk with center (144, 72) and radius 26 then Draws a red line from (417, 98) to (494, 56) then Places a purple dot at position (121, 143).
; PLAN: r0=144(x), r1=72(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=417(x1), r6=98(y1), r7=494(x2), r8=56(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=121(x), r11=143(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 72
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 417
LDI r6, 98
LDI r7, 494
LDI r8, 56
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 121
LDI r11, 143
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
