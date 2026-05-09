; DESCRIPTION: Renders a white box of size 47x59 starting at (167, 76).
; PLAN: r0=167(x), r1=76(y), r2=47(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 76
LDI r2, 47
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
