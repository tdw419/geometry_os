; DESCRIPTION: Renders a green box of size 35x59 starting at (352, 72).
; PLAN: r0=352(x), r1=72(y), r2=35(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 72
LDI r2, 35
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
