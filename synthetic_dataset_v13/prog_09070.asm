; DESCRIPTION: Renders a green box of size 63x59 starting at (7, 117).
; PLAN: r0=7(x), r1=117(y), r2=63(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 117
LDI r2, 63
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
