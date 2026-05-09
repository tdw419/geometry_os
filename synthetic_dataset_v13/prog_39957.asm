; DESCRIPTION: Renders a white box of size 65x103 starting at (245, 26).
; PLAN: r0=245(x), r1=26(y), r2=65(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 26
LDI r2, 65
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
