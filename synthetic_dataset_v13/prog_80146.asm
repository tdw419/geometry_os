; DESCRIPTION: Draws a cyan rectangle at (215, 79) with width 32 and height 102.
; PLAN: r0=215(x), r1=79(y), r2=32(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 79
LDI r2, 32
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
