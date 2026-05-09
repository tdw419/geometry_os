; DESCRIPTION: Renders a orange box of size 120x92 starting at (124, 140).
; PLAN: r0=124(x), r1=140(y), r2=120(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 140
LDI r2, 120
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
