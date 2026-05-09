; DESCRIPTION: Renders a cyan box of size 42x28 starting at (17, 18).
; PLAN: r0=17(x), r1=18(y), r2=42(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 18
LDI r2, 42
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
