; DESCRIPTION: Renders a white box of size 86x33 starting at (259, 126).
; PLAN: r0=259(x), r1=126(y), r2=86(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 126
LDI r2, 86
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
