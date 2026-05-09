; DESCRIPTION: Renders a cyan box of size 60x18 starting at (311, 135).
; PLAN: r0=311(x), r1=135(y), r2=60(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 135
LDI r2, 60
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
