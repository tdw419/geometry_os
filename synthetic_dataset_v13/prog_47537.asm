; DESCRIPTION: Renders a magenta box of size 27x40 starting at (295, 144).
; PLAN: r0=295(x), r1=144(y), r2=27(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 144
LDI r2, 27
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
