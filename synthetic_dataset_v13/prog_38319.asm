; DESCRIPTION: Renders a cyan box of size 14x118 starting at (124, 114).
; PLAN: r0=124(x), r1=114(y), r2=14(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 114
LDI r2, 14
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
