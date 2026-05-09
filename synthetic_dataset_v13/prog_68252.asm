; DESCRIPTION: Draws a cyan rectangle at (257, 173) with width 72 and height 65.
; PLAN: r0=257(x), r1=173(y), r2=72(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 173
LDI r2, 72
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
