; DESCRIPTION: Composite: Places a red 42x31 rectangle at position (418, 111) then Renders a blue disk with center (446, 154) and radius 26 then Places a black dot at position (27, 144).
; PLAN: r0=418(x), r1=111(y), r2=42(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=154(y), r7=26(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=144(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 111
LDI r2, 42
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 154
LDI r7, 26
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 144
LDI r12, 0x000000
PSET r10, r11, r12
HALT
