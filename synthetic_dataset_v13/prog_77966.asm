; DESCRIPTION: Draws a cyan rectangle at (244, 131) with width 57 and height 26.
; PLAN: r0=244(x), r1=131(y), r2=57(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 131
LDI r2, 57
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
