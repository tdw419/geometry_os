; DESCRIPTION: Renders a green box of size 72x56 starting at (104, 2).
; PLAN: r0=104(x), r1=2(y), r2=72(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 2
LDI r2, 72
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
