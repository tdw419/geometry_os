; DESCRIPTION: Renders a cyan box of size 64x81 starting at (68, 65).
; PLAN: r0=68(x), r1=65(y), r2=64(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 65
LDI r2, 64
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
