; DESCRIPTION: Renders a orange box of size 78x22 starting at (240, 214).
; PLAN: r0=240(x), r1=214(y), r2=78(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 214
LDI r2, 78
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
