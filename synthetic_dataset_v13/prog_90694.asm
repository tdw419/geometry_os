; DESCRIPTION: Renders a magenta box of size 20x86 starting at (426, 146).
; PLAN: r0=426(x), r1=146(y), r2=20(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 146
LDI r2, 20
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
