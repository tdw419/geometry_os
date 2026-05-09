; DESCRIPTION: Renders a cyan box of size 32x71 starting at (64, 185).
; PLAN: r0=64(x), r1=185(y), r2=32(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 185
LDI r2, 32
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
