; DESCRIPTION: Draws a cyan rectangle at (480, 40) with width 19 and height 42.
; PLAN: r0=480(x), r1=40(y), r2=19(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 40
LDI r2, 19
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
