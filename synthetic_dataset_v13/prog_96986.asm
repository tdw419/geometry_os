; DESCRIPTION: Renders a green box of size 76x24 starting at (432, 228).
; PLAN: r0=432(x), r1=228(y), r2=76(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 228
LDI r2, 76
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
