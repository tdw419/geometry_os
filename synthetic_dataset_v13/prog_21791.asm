; DESCRIPTION: Renders a orange box of size 73x102 starting at (439, 139).
; PLAN: r0=439(x), r1=139(y), r2=73(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 139
LDI r2, 73
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
