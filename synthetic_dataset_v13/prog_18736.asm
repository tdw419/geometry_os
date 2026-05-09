; DESCRIPTION: Renders a orange box of size 14x79 starting at (322, 73).
; PLAN: r0=322(x), r1=73(y), r2=14(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 73
LDI r2, 14
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
