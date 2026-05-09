; DESCRIPTION: Renders a cyan box of size 23x22 starting at (203, 183).
; PLAN: r0=203(x), r1=183(y), r2=23(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 183
LDI r2, 23
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
