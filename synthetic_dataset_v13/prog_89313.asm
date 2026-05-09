; DESCRIPTION: Renders a green box of size 32x10 starting at (428, 84).
; PLAN: r0=428(x), r1=84(y), r2=32(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 84
LDI r2, 32
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
