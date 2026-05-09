; DESCRIPTION: Renders a green box of size 59x38 starting at (184, 65).
; PLAN: r0=184(x), r1=65(y), r2=59(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 65
LDI r2, 59
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
