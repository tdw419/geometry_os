; DESCRIPTION: Renders a magenta box of size 103x52 starting at (275, 156).
; PLAN: r0=275(x), r1=156(y), r2=103(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 156
LDI r2, 103
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
