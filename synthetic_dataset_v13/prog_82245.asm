; DESCRIPTION: Renders a green box of size 23x109 starting at (460, 25).
; PLAN: r0=460(x), r1=25(y), r2=23(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 25
LDI r2, 23
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
