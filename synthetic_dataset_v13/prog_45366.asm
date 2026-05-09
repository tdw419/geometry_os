; DESCRIPTION: Renders a white box of size 108x86 starting at (6, 90).
; PLAN: r0=6(x), r1=90(y), r2=108(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 90
LDI r2, 108
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
