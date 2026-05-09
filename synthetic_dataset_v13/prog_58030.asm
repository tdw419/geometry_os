; DESCRIPTION: Renders a green box of size 23x59 starting at (126, 182).
; PLAN: r0=126(x), r1=182(y), r2=23(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 182
LDI r2, 23
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
