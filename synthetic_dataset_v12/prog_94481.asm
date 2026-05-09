; DESCRIPTION: Renders a orange box of size 30x11 starting at (214, 171).
; PLAN: r0=214(x), r1=171(y), r2=30(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 171
LDI r2, 30
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
