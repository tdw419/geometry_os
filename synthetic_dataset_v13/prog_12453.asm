; DESCRIPTION: Renders a cyan box of size 58x66 starting at (140, 93).
; PLAN: r0=140(x), r1=93(y), r2=58(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 93
LDI r2, 58
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
