; DESCRIPTION: Draws a green rectangle at (214, 120) with width 64 and height 105.
; PLAN: r0=214(x), r1=120(y), r2=64(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 120
LDI r2, 64
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
