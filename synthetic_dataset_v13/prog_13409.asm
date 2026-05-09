; DESCRIPTION: Renders a cyan box of size 106x91 starting at (156, 118).
; PLAN: r0=156(x), r1=118(y), r2=106(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 118
LDI r2, 106
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
