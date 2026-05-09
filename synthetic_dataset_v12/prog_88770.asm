; DESCRIPTION: Renders a orange box of size 44x12 starting at (405, 60).
; PLAN: r0=405(x), r1=60(y), r2=44(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 60
LDI r2, 44
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
