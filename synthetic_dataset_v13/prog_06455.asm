; DESCRIPTION: Renders a orange box of size 16x71 starting at (279, 176).
; PLAN: r0=279(x), r1=176(y), r2=16(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 176
LDI r2, 16
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
