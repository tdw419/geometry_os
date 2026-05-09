; DESCRIPTION: Renders a magenta box of size 48x95 starting at (275, 25).
; PLAN: r0=275(x), r1=25(y), r2=48(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 25
LDI r2, 48
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
