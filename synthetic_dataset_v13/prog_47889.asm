; DESCRIPTION: Renders a orange box of size 70x109 starting at (286, 135).
; PLAN: r0=286(x), r1=135(y), r2=70(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 135
LDI r2, 70
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
