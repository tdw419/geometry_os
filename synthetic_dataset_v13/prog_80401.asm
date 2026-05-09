; DESCRIPTION: Draws a cyan rectangle at (286, 21) with width 53 and height 12.
; PLAN: r0=286(x), r1=21(y), r2=53(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 21
LDI r2, 53
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
