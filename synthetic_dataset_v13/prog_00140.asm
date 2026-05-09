; DESCRIPTION: Composite: Places a black 95x16 rectangle at position (365, 35) then Places a purple dot at position (127, 104) then Renders a green disk with center (317, 111) and radius 70.
; PLAN: r0=365(x), r1=35(y), r2=95(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=104(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=317(x), r11=111(y), r12=70(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 35
LDI r2, 95
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 104
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 317
LDI r11, 111
LDI r12, 70
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
