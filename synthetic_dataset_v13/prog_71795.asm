; DESCRIPTION: Draws a black rectangle at (445, 21) with width 50 and height 11.
; PLAN: r0=445(x), r1=21(y), r2=50(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 21
LDI r2, 50
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
