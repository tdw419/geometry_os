; DESCRIPTION: Renders a cyan box of size 56x12 starting at (261, 64).
; PLAN: r0=261(x), r1=64(y), r2=56(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 64
LDI r2, 56
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
