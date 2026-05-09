; DESCRIPTION: Renders a white box of size 56x38 starting at (187, 153).
; PLAN: r0=187(x), r1=153(y), r2=56(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 153
LDI r2, 56
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
