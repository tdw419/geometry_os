; DESCRIPTION: Draws a cyan rectangle at (149, 42) with width 53 and height 104.
; PLAN: r0=149(x), r1=42(y), r2=53(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 42
LDI r2, 53
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
