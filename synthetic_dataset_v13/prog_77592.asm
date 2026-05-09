; DESCRIPTION: Renders a green box of size 103x64 starting at (4, 1).
; PLAN: r0=4(x), r1=1(y), r2=103(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 1
LDI r2, 103
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
