; DESCRIPTION: Renders a white box of size 59x95 starting at (21, 39).
; PLAN: r0=21(x), r1=39(y), r2=59(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 39
LDI r2, 59
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
