; DESCRIPTION: Renders a cyan box of size 74x86 starting at (126, 89).
; PLAN: r0=126(x), r1=89(y), r2=74(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 89
LDI r2, 74
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
