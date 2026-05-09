; DESCRIPTION: Renders a cyan box of size 59x52 starting at (49, 62).
; PLAN: r0=49(x), r1=62(y), r2=59(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 62
LDI r2, 59
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
