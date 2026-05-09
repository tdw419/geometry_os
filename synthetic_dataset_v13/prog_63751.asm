; DESCRIPTION: Renders a cyan box of size 111x118 starting at (259, 129).
; PLAN: r0=259(x), r1=129(y), r2=111(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 129
LDI r2, 111
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
