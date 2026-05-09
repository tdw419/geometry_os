; DESCRIPTION: Draws a cyan rectangle at (228, 226) with width 85 and height 30.
; PLAN: r0=228(x), r1=226(y), r2=85(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 226
LDI r2, 85
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
