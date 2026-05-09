; DESCRIPTION: Renders a cyan box of size 85x105 starting at (72, 128).
; PLAN: r0=72(x), r1=128(y), r2=85(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 128
LDI r2, 85
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
