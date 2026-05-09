; DESCRIPTION: Renders a white box of size 89x29 starting at (294, 59).
; PLAN: r0=294(x), r1=59(y), r2=89(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 59
LDI r2, 89
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
