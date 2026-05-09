; DESCRIPTION: Renders a cyan box of size 45x12 starting at (128, 77).
; PLAN: r0=128(x), r1=77(y), r2=45(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 77
LDI r2, 45
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
