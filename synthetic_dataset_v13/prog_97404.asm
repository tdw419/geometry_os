; DESCRIPTION: Composite: Places a blue 65x105 rectangle at position (276, 104) then Renders a red disk with center (362, 73) and radius 10 then Places a black dot at position (419, 213).
; PLAN: r0=276(x), r1=104(y), r2=65(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=73(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x), r11=213(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 276
LDI r1, 104
LDI r2, 65
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 73
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 213
LDI r12, 0x000000
PSET r10, r11, r12
HALT
