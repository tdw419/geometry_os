; DESCRIPTION: Renders a orange box of size 33x76 starting at (262, 124).
; PLAN: r0=262(x), r1=124(y), r2=33(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 124
LDI r2, 33
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
