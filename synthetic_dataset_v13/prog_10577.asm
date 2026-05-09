; DESCRIPTION: Renders a green box of size 92x56 starting at (176, 40).
; PLAN: r0=176(x), r1=40(y), r2=92(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 40
LDI r2, 92
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
