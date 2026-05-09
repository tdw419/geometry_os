; DESCRIPTION: Renders a cyan box of size 11x64 starting at (357, 102).
; PLAN: r0=357(x), r1=102(y), r2=11(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 102
LDI r2, 11
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
