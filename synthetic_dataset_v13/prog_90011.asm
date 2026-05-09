; DESCRIPTION: Composite: Places a black circle of radius 47 at center (256, 120) then Draws a blue rectangle at (307, 196) with width 82 and height 39 then Sets a single cyan pixel at (93, 107).
; PLAN: r0=256(x), r1=120(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=196(y), r7=82(width), r8=39(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=93(x), r11=107(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 120
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 196
LDI r7, 82
LDI r8, 39
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 107
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
