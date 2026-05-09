; DESCRIPTION: Renders a cyan box of size 84x108 starting at (361, 87).
; PLAN: r0=361(x), r1=87(y), r2=84(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 87
LDI r2, 84
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
