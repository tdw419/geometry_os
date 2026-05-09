; DESCRIPTION: Composite: Renders a cyan disk with center (309, 134) and radius 57 then Sets a single blue pixel at (279, 225) then Places a cyan 72x49 rectangle at position (398, 107).
; PLAN: r0=309(x), r1=134(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=225(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=398(x), r11=107(y), r12=72(width), r13=49(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 134
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 225
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 398
LDI r11, 107
LDI r12, 72
LDI r13, 49
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
