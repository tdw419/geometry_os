; DESCRIPTION: Renders a cyan box of size 100x66 starting at (137, 63).
; PLAN: r0=137(x), r1=63(y), r2=100(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 63
LDI r2, 100
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
