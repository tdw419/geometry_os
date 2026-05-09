; DESCRIPTION: Renders a white box of size 47x19 starting at (28, 223).
; PLAN: r0=28(x), r1=223(y), r2=47(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 223
LDI r2, 47
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
