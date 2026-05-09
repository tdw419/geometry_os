; DESCRIPTION: Renders a green box of size 46x15 starting at (107, 168).
; PLAN: r0=107(x), r1=168(y), r2=46(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 168
LDI r2, 46
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
