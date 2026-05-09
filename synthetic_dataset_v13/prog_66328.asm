; DESCRIPTION: Draws a black rectangle at (214, 107) with width 27 and height 16.
; PLAN: r0=214(x), r1=107(y), r2=27(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 107
LDI r2, 27
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
