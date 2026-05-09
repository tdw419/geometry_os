; DESCRIPTION: Renders a green box of size 68x28 starting at (90, 191).
; PLAN: r0=90(x), r1=191(y), r2=68(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 191
LDI r2, 68
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
