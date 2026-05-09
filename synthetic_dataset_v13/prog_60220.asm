; DESCRIPTION: Renders a white box of size 111x24 starting at (326, 59).
; PLAN: r0=326(x), r1=59(y), r2=111(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 59
LDI r2, 111
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
