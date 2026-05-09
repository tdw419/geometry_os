; DESCRIPTION: Composite: Draws a white rectangle at (394, 22) with width 108 and height 99 then Places a cyan dot at position (480, 189).
; PLAN: r0=394(x), r1=22(y), r2=108(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=480(x), r6=189(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 22
LDI r2, 108
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 189
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
