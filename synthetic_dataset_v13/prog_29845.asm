; DESCRIPTION: Renders a cyan box of size 19x76 starting at (23, 9).
; PLAN: r0=23(x), r1=9(y), r2=19(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 9
LDI r2, 19
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
