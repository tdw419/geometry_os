; DESCRIPTION: Draws a cyan rectangle at (61, 97) with width 82 and height 21.
; PLAN: r0=61(x), r1=97(y), r2=82(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 97
LDI r2, 82
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
