; DESCRIPTION: Renders a cyan box of size 49x76 starting at (128, 123).
; PLAN: r0=128(x), r1=123(y), r2=49(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 123
LDI r2, 49
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
