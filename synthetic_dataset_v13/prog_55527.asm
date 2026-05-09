; DESCRIPTION: Renders a cyan box of size 32x103 starting at (89, 72).
; PLAN: r0=89(x), r1=72(y), r2=32(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 72
LDI r2, 32
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
