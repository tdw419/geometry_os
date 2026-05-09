; DESCRIPTION: Renders a green box of size 30x98 starting at (142, 59).
; PLAN: r0=142(x), r1=59(y), r2=30(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 59
LDI r2, 30
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
