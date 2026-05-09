; DESCRIPTION: Renders a white box of size 44x21 starting at (382, 59).
; PLAN: r0=382(x), r1=59(y), r2=44(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 59
LDI r2, 44
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
