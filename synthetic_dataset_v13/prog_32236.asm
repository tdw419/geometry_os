; DESCRIPTION: Renders a orange box of size 55x71 starting at (4, 164).
; PLAN: r0=4(x), r1=164(y), r2=55(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 164
LDI r2, 55
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
