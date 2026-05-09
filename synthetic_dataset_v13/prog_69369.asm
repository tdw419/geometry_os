; DESCRIPTION: Renders a orange box of size 103x30 starting at (249, 175).
; PLAN: r0=249(x), r1=175(y), r2=103(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 175
LDI r2, 103
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
