; DESCRIPTION: Renders a cyan box of size 118x112 starting at (208, 139).
; PLAN: r0=208(x), r1=139(y), r2=118(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 139
LDI r2, 118
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
