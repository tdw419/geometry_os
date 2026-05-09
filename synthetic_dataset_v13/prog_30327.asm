; DESCRIPTION: Composite: Places a magenta 20x61 rectangle at position (229, 110) then Renders a cyan disk with center (455, 52) and radius 36 then Places a red dot at position (40, 74).
; PLAN: r0=229(x), r1=110(y), r2=20(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=52(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=40(x), r11=74(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 110
LDI r2, 20
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 52
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 40
LDI r11, 74
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
