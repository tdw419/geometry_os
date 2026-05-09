; DESCRIPTION: Renders a cyan box of size 58x18 starting at (153, 75).
; PLAN: r0=153(x), r1=75(y), r2=58(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 75
LDI r2, 58
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
