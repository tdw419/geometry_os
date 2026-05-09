; DESCRIPTION: Draws a cyan rectangle at (464, 100) with width 45 and height 96.
; PLAN: r0=464(x), r1=100(y), r2=45(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 100
LDI r2, 45
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
