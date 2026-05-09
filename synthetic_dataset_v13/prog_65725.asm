; DESCRIPTION: Renders a cyan box of size 95x114 starting at (274, 57).
; PLAN: r0=274(x), r1=57(y), r2=95(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 57
LDI r2, 95
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
