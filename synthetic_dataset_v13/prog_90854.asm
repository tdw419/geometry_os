; DESCRIPTION: Renders a cyan box of size 102x97 starting at (334, 69).
; PLAN: r0=334(x), r1=69(y), r2=102(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 69
LDI r2, 102
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
