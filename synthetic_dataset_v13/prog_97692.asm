; DESCRIPTION: Renders a cyan box of size 32x75 starting at (357, 22).
; PLAN: r0=357(x), r1=22(y), r2=32(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 22
LDI r2, 32
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
