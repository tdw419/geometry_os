; DESCRIPTION: Renders a orange box of size 47x33 starting at (169, 204).
; PLAN: r0=169(x), r1=204(y), r2=47(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 204
LDI r2, 47
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
