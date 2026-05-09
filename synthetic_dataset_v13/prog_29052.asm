; DESCRIPTION: Renders a green box of size 59x90 starting at (139, 15).
; PLAN: r0=139(x), r1=15(y), r2=59(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 15
LDI r2, 59
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
