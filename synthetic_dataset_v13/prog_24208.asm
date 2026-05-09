; DESCRIPTION: Renders a cyan box of size 32x114 starting at (215, 88).
; PLAN: r0=215(x), r1=88(y), r2=32(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 88
LDI r2, 32
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
