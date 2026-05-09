; DESCRIPTION: Renders a green box of size 28x85 starting at (213, 126).
; PLAN: r0=213(x), r1=126(y), r2=28(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 126
LDI r2, 28
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
