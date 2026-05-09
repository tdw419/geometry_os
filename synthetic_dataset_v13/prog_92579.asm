; DESCRIPTION: Renders a green box of size 103x78 starting at (126, 39).
; PLAN: r0=126(x), r1=39(y), r2=103(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 39
LDI r2, 103
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
