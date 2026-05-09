; DESCRIPTION: Renders a green box of size 86x111 starting at (25, 37).
; PLAN: r0=25(x), r1=37(y), r2=86(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 37
LDI r2, 86
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
