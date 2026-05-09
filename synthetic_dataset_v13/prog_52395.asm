; DESCRIPTION: Renders a black box of size 32x11 starting at (184, 242).
; PLAN: r0=184(x), r1=242(y), r2=32(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 242
LDI r2, 32
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
