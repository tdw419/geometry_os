; DESCRIPTION: Renders a green box of size 16x10 starting at (75, 219).
; PLAN: r0=75(x), r1=219(y), r2=16(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 219
LDI r2, 16
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
