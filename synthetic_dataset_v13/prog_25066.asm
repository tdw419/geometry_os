; DESCRIPTION: Draws a yellow rectangle at (205, 228) with width 108 and height 21.
; PLAN: r0=205(x), r1=228(y), r2=108(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 228
LDI r2, 108
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
