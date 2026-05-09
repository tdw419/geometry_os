; DESCRIPTION: Renders a white box of size 117x17 starting at (9, 126).
; PLAN: r0=9(x), r1=126(y), r2=117(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 126
LDI r2, 117
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
