; DESCRIPTION: Renders a green box of size 97x48 starting at (268, 193).
; PLAN: r0=268(x), r1=193(y), r2=97(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 193
LDI r2, 97
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
