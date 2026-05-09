; DESCRIPTION: Draws a cyan rectangle at (294, 181) with width 73 and height 14.
; PLAN: r0=294(x), r1=181(y), r2=73(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 181
LDI r2, 73
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
