; DESCRIPTION: Renders a green box of size 23x90 starting at (268, 15).
; PLAN: r0=268(x), r1=15(y), r2=23(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 15
LDI r2, 23
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
