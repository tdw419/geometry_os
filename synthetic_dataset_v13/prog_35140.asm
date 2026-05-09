; DESCRIPTION: Renders a cyan box of size 78x49 starting at (68, 26).
; PLAN: r0=68(x), r1=26(y), r2=78(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 26
LDI r2, 78
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
