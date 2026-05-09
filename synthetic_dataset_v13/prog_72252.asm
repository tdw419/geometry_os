; DESCRIPTION: Composite: Places a white circle of radius 66 at center (344, 146) then Places a blue dot at position (261, 118) then Places a cyan 111x76 rectangle at position (265, 62).
; PLAN: r0=344(x), r1=146(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x), r6=118(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=62(y), r12=111(width), r13=76(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 146
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 118
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 265
LDI r11, 62
LDI r12, 111
LDI r13, 76
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
