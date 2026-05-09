; DESCRIPTION: Renders a orange box of size 68x98 starting at (217, 60).
; PLAN: r0=217(x), r1=60(y), r2=68(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 60
LDI r2, 68
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
