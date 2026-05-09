; DESCRIPTION: Renders a green box of size 59x90 starting at (339, 36).
; PLAN: r0=339(x), r1=36(y), r2=59(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 36
LDI r2, 59
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
