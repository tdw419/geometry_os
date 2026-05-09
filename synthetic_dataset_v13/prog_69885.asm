; DESCRIPTION: Renders a cyan box of size 24x118 starting at (140, 39).
; PLAN: r0=140(x), r1=39(y), r2=24(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 39
LDI r2, 24
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
