; DESCRIPTION: Draws a cyan rectangle at (215, 212) with width 76 and height 38.
; PLAN: r0=215(x), r1=212(y), r2=76(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 212
LDI r2, 76
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
