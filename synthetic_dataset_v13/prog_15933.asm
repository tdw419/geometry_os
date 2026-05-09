; DESCRIPTION: Renders a green box of size 76x24 starting at (372, 19).
; PLAN: r0=372(x), r1=19(y), r2=76(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 19
LDI r2, 76
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
