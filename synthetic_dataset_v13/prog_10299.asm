; DESCRIPTION: Renders a orange box of size 92x73 starting at (191, 16).
; PLAN: r0=191(x), r1=16(y), r2=92(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 16
LDI r2, 92
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
