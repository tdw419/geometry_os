; DESCRIPTION: Renders a orange box of size 112x92 starting at (260, 2).
; PLAN: r0=260(x), r1=2(y), r2=112(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 2
LDI r2, 112
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
