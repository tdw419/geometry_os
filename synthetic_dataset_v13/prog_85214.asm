; DESCRIPTION: Renders a green box of size 49x64 starting at (354, 109).
; PLAN: r0=354(x), r1=109(y), r2=49(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 109
LDI r2, 49
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
