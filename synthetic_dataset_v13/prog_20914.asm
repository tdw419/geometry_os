; DESCRIPTION: Renders a orange box of size 82x25 starting at (148, 174).
; PLAN: r0=148(x), r1=174(y), r2=82(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 174
LDI r2, 82
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
