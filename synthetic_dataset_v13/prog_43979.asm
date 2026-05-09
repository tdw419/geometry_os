; DESCRIPTION: Draws a red rectangle at (271, 111) with width 56 and height 58.
; PLAN: r0=271(x), r1=111(y), r2=56(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 111
LDI r2, 56
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
