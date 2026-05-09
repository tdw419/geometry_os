; DESCRIPTION: Renders a magenta box of size 27x68 starting at (96, 35).
; PLAN: r0=96(x), r1=35(y), r2=27(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 35
LDI r2, 27
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
