; DESCRIPTION: Renders a cyan box of size 24x87 starting at (421, 128).
; PLAN: r0=421(x), r1=128(y), r2=24(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 128
LDI r2, 24
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
