; DESCRIPTION: Renders a cyan box of size 93x31 starting at (203, 216).
; PLAN: r0=203(x), r1=216(y), r2=93(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 216
LDI r2, 93
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
