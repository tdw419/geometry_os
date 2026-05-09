; DESCRIPTION: Draws a cyan rectangle at (394, 75) with width 30 and height 47.
; PLAN: r0=394(x), r1=75(y), r2=30(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 75
LDI r2, 30
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
