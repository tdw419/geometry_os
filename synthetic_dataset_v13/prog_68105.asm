; DESCRIPTION: Draws a cyan rectangle at (215, 193) with width 93 and height 62.
; PLAN: r0=215(x), r1=193(y), r2=93(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 193
LDI r2, 93
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
