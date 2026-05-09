; DESCRIPTION: Renders a cyan box of size 84x85 starting at (43, 66).
; PLAN: r0=43(x), r1=66(y), r2=84(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 66
LDI r2, 84
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
