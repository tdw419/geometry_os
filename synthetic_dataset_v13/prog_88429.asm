; DESCRIPTION: Draws a yellow rectangle at (372, 25) with width 64 and height 50.
; PLAN: r0=372(x), r1=25(y), r2=64(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 25
LDI r2, 64
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
