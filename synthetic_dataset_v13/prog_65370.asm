; DESCRIPTION: Renders a white box of size 101x103 starting at (202, 100).
; PLAN: r0=202(x), r1=100(y), r2=101(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 100
LDI r2, 101
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
