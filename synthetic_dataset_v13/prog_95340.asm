; DESCRIPTION: Renders a green box of size 61x110 starting at (304, 43).
; PLAN: r0=304(x), r1=43(y), r2=61(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 43
LDI r2, 61
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
