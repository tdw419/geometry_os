; DESCRIPTION: Draws a orange rectangle at (214, 142) with width 107 and height 111.
; PLAN: r0=214(x), r1=142(y), r2=107(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 142
LDI r2, 107
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
