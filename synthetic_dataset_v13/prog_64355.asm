; DESCRIPTION: Renders a cyan box of size 85x63 starting at (107, 158).
; PLAN: r0=107(x), r1=158(y), r2=85(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 158
LDI r2, 85
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
