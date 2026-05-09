; DESCRIPTION: Draws a black rectangle at (294, 117) with width 98 and height 57.
; PLAN: r0=294(x), r1=117(y), r2=98(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 117
LDI r2, 98
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
