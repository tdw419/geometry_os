; DESCRIPTION: Renders a cyan box of size 18x94 starting at (393, 56).
; PLAN: r0=393(x), r1=56(y), r2=18(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 56
LDI r2, 18
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
