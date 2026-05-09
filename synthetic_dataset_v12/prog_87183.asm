; DESCRIPTION: Draws a cyan rectangle at (269, 208) with width 19 and height 42.
; PLAN: r0=269(x), r1=208(y), r2=19(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 208
LDI r2, 19
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
