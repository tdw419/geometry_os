; DESCRIPTION: Draws a cyan rectangle at (107, 167) with width 39 and height 61.
; PLAN: r0=107(x), r1=167(y), r2=39(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 167
LDI r2, 39
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
