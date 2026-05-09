; DESCRIPTION: Renders a green box of size 82x61 starting at (86, 64).
; PLAN: r0=86(x), r1=64(y), r2=82(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 64
LDI r2, 82
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
