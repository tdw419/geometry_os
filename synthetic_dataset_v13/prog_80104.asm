; DESCRIPTION: Renders a orange box of size 112x48 starting at (153, 206).
; PLAN: r0=153(x), r1=206(y), r2=112(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 206
LDI r2, 112
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
