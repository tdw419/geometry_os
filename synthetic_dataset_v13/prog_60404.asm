; DESCRIPTION: Renders a orange box of size 114x16 starting at (214, 202).
; PLAN: r0=214(x), r1=202(y), r2=114(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 202
LDI r2, 114
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
