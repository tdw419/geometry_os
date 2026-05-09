; DESCRIPTION: Renders a cyan box of size 87x94 starting at (309, 74).
; PLAN: r0=309(x), r1=74(y), r2=87(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 74
LDI r2, 87
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
