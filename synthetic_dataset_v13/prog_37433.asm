; DESCRIPTION: Renders a magenta box of size 106x27 starting at (406, 179).
; PLAN: r0=406(x), r1=179(y), r2=106(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 179
LDI r2, 106
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
