; DESCRIPTION: Renders a green box of size 87x57 starting at (102, 162).
; PLAN: r0=102(x), r1=162(y), r2=87(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 162
LDI r2, 87
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
