; DESCRIPTION: Renders a orange box of size 68x105 starting at (236, 57).
; PLAN: r0=236(x), r1=57(y), r2=68(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 57
LDI r2, 68
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
