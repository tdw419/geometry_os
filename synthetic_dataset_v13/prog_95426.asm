; DESCRIPTION: Renders a cyan box of size 19x110 starting at (102, 144).
; PLAN: r0=102(x), r1=144(y), r2=19(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 144
LDI r2, 19
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
