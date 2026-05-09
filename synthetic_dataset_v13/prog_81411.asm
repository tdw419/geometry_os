; DESCRIPTION: Renders a black box of size 59x58 starting at (354, 27).
; PLAN: r0=354(x), r1=27(y), r2=59(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 27
LDI r2, 59
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
