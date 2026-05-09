; DESCRIPTION: Renders a white box of size 30x59 starting at (326, 35).
; PLAN: r0=326(x), r1=35(y), r2=30(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 35
LDI r2, 30
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
