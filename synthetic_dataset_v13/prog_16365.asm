; DESCRIPTION: Renders a cyan box of size 106x24 starting at (26, 17).
; PLAN: r0=26(x), r1=17(y), r2=106(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 17
LDI r2, 106
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
