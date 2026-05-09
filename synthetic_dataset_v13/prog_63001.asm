; DESCRIPTION: Renders a cyan box of size 60x66 starting at (52, 66).
; PLAN: r0=52(x), r1=66(y), r2=60(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 66
LDI r2, 60
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
