; DESCRIPTION: Renders a orange box of size 102x11 starting at (77, 174).
; PLAN: r0=77(x), r1=174(y), r2=102(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 174
LDI r2, 102
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
