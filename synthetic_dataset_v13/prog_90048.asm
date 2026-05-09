; DESCRIPTION: Renders a cyan box of size 77x118 starting at (140, 57).
; PLAN: r0=140(x), r1=57(y), r2=77(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 57
LDI r2, 77
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
