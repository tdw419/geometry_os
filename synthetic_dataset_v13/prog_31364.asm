; DESCRIPTION: Renders a green box of size 119x27 starting at (305, 127).
; PLAN: r0=305(x), r1=127(y), r2=119(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 127
LDI r2, 119
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
