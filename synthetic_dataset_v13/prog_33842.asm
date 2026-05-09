; DESCRIPTION: Draws a cyan rectangle at (163, 2) with width 99 and height 93.
; PLAN: r0=163(x), r1=2(y), r2=99(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 2
LDI r2, 99
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
