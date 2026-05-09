; DESCRIPTION: Renders a cyan box of size 18x72 starting at (357, 87).
; PLAN: r0=357(x), r1=87(y), r2=18(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 87
LDI r2, 18
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
