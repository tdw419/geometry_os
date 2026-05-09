; DESCRIPTION: Draws a cyan rectangle at (494, 18) with width 16 and height 103.
; PLAN: r0=494(x), r1=18(y), r2=16(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 18
LDI r2, 16
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
