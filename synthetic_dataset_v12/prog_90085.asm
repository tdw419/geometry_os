; DESCRIPTION: Composite: Draws a cyan rectangle at (369, 31) with width 48 and height 23 then Places a yellow dot at position (300, 43).
; PLAN: r0=369(x), r1=31(y), r2=48(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=43(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 369
LDI r1, 31
LDI r2, 48
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 43
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
