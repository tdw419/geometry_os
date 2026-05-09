; DESCRIPTION: Renders a cyan box of size 32x112 starting at (322, 99).
; PLAN: r0=322(x), r1=99(y), r2=32(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 99
LDI r2, 32
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
