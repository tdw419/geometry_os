; DESCRIPTION: Renders a cyan box of size 115x106 starting at (23, 109).
; PLAN: r0=23(x), r1=109(y), r2=115(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 109
LDI r2, 115
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
