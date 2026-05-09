; DESCRIPTION: Renders a cyan box of size 52x75 starting at (357, 53).
; PLAN: r0=357(x), r1=53(y), r2=52(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 53
LDI r2, 52
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
