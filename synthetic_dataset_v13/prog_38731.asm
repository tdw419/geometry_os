; DESCRIPTION: Renders a cyan box of size 63x101 starting at (107, 115).
; PLAN: r0=107(x), r1=115(y), r2=63(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 115
LDI r2, 63
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
