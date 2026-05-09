; DESCRIPTION: Draws a black rectangle at (228, 44) with width 46 and height 50.
; PLAN: r0=228(x), r1=44(y), r2=46(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 44
LDI r2, 46
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
