; DESCRIPTION: Draws a cyan rectangle at (376, 99) with width 58 and height 56.
; PLAN: r0=376(x), r1=99(y), r2=58(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 99
LDI r2, 58
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
