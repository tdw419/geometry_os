; DESCRIPTION: Composite: Places a red 62x109 rectangle at position (135, 128) then Renders a orange disk with center (261, 110) and radius 74 then Places a cyan dot at position (106, 215).
; PLAN: r0=135(x), r1=128(y), r2=62(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=110(y), r7=74(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=106(x), r11=215(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 128
LDI r2, 62
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 110
LDI r7, 74
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 106
LDI r11, 215
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
