; DESCRIPTION: Draws a cyan rectangle at (64, 46) with width 72 and height 47.
; PLAN: r0=64(x), r1=46(y), r2=72(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 46
LDI r2, 72
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
