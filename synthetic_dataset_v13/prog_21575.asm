; DESCRIPTION: Draws a cyan rectangle at (372, 53) with width 12 and height 73.
; PLAN: r0=372(x), r1=53(y), r2=12(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 53
LDI r2, 12
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
