; DESCRIPTION: Composite: Draws a red rectangle at (283, 143) with width 16 and height 95 then Places a yellow dot at position (185, 65).
; PLAN: r0=283(x), r1=143(y), r2=16(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=65(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 143
LDI r2, 16
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 65
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
