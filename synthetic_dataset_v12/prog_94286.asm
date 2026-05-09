; DESCRIPTION: Renders a orange box of size 107x81 starting at (346, 175).
; PLAN: r0=346(x), r1=175(y), r2=107(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 175
LDI r2, 107
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
