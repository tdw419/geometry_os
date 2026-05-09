; DESCRIPTION: Renders a cyan box of size 25x66 starting at (167, 76).
; PLAN: r0=167(x), r1=76(y), r2=25(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 76
LDI r2, 25
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
