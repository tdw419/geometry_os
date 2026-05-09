; DESCRIPTION: Draws a cyan rectangle at (425, 90) with width 58 and height 39.
; PLAN: r0=425(x), r1=90(y), r2=58(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 90
LDI r2, 58
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
