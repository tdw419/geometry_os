; DESCRIPTION: Renders a orange box of size 55x33 starting at (47, 146).
; PLAN: r0=47(x), r1=146(y), r2=55(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 146
LDI r2, 55
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
