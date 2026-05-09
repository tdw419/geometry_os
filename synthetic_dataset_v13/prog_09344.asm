; DESCRIPTION: Renders a green box of size 24x120 starting at (128, 23).
; PLAN: r0=128(x), r1=23(y), r2=24(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 23
LDI r2, 24
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
