; DESCRIPTION: Renders a orange box of size 43x66 starting at (356, 177).
; PLAN: r0=356(x), r1=177(y), r2=43(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 177
LDI r2, 43
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
