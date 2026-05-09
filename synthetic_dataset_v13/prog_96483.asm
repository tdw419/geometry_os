; DESCRIPTION: Draws a cyan rectangle at (416, 42) with width 32 and height 49.
; PLAN: r0=416(x), r1=42(y), r2=32(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 42
LDI r2, 32
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
