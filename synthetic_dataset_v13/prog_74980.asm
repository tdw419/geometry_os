; DESCRIPTION: Renders a green box of size 65x105 starting at (413, 127).
; PLAN: r0=413(x), r1=127(y), r2=65(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 127
LDI r2, 65
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
