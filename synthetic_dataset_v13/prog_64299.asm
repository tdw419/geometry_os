; DESCRIPTION: Composite: Places a black 89x56 rectangle at position (387, 195) then Renders a red disk with center (180, 168) and radius 48 then Sets a single red pixel at (496, 37).
; PLAN: r0=387(x), r1=195(y), r2=89(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x), r6=168(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=496(x), r11=37(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 387
LDI r1, 195
LDI r2, 89
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 168
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 496
LDI r11, 37
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
