; DESCRIPTION: Draws a cyan rectangle at (157, 215) with width 63 and height 28.
; PLAN: r0=157(x), r1=215(y), r2=63(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 215
LDI r2, 63
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
