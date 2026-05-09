; DESCRIPTION: Draws a yellow rectangle at (271, 228) with width 68 and height 28.
; PLAN: r0=271(x), r1=228(y), r2=68(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 228
LDI r2, 68
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
