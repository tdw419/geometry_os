; DESCRIPTION: Renders a magenta box of size 42x91 starting at (20, 46).
; PLAN: r0=20(x), r1=46(y), r2=42(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 46
LDI r2, 42
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
