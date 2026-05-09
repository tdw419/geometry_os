; DESCRIPTION: Renders a white box of size 69x103 starting at (171, 126).
; PLAN: r0=171(x), r1=126(y), r2=69(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 126
LDI r2, 69
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
