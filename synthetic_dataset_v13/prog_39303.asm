; DESCRIPTION: Renders a cyan box of size 39x28 starting at (78, 76).
; PLAN: r0=78(x), r1=76(y), r2=39(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 76
LDI r2, 39
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
