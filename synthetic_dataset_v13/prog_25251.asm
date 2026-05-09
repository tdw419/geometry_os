; DESCRIPTION: Renders a black box of size 10x84 starting at (392, 68).
; PLAN: r0=392(x), r1=68(y), r2=10(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 68
LDI r2, 10
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
