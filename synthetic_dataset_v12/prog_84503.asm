; DESCRIPTION: Renders a green box of size 105x25 starting at (0, 113).
; PLAN: r0=0(x), r1=113(y), r2=105(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 113
LDI r2, 105
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
