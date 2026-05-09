; DESCRIPTION: Renders a cyan box of size 84x101 starting at (293, 115).
; PLAN: r0=293(x), r1=115(y), r2=84(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 115
LDI r2, 84
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
