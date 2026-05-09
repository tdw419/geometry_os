; DESCRIPTION: Draws a cyan rectangle at (383, 39) with width 75 and height 45.
; PLAN: r0=383(x), r1=39(y), r2=75(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 39
LDI r2, 75
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
