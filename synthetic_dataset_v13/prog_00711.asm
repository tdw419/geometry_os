; DESCRIPTION: Draws a cyan rectangle at (165, 42) with width 47 and height 118.
; PLAN: r0=165(x), r1=42(y), r2=47(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 42
LDI r2, 47
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
