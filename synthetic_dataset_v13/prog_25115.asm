; DESCRIPTION: Renders a white box of size 91x55 starting at (123, 173).
; PLAN: r0=123(x), r1=173(y), r2=91(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 173
LDI r2, 91
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
