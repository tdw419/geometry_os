; DESCRIPTION: Renders a green box of size 12x27 starting at (127, 144).
; PLAN: r0=127(x), r1=144(y), r2=12(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 144
LDI r2, 12
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
