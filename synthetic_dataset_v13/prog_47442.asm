; DESCRIPTION: Composite: Creates a cyan circular shape at (465, 163) with radius 23 then Draws a red rectangle at (265, 124) with width 51 and height 120 then Sets a single cyan pixel at (101, 175).
; PLAN: r0=465(x), r1=163(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=124(y), r7=51(width), r8=120(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=101(x), r11=175(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 163
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 124
LDI r7, 51
LDI r8, 120
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 175
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
