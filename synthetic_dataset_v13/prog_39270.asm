; DESCRIPTION: Renders a cyan box of size 87x29 starting at (44, 72).
; PLAN: r0=44(x), r1=72(y), r2=87(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 72
LDI r2, 87
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
