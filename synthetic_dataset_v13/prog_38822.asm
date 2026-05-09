; DESCRIPTION: Composite: Draws a black rectangle at (403, 90) with width 52 and height 120 then Creates a black circular shape at (366, 187) with radius 37 then Places a cyan dot at position (71, 243).
; PLAN: r0=403(x), r1=90(y), r2=52(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=187(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=243(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 90
LDI r2, 52
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 187
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 243
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
