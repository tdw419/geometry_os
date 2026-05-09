; DESCRIPTION: Renders a magenta box of size 63x59 starting at (152, 33).
; PLAN: r0=152(x), r1=33(y), r2=63(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 33
LDI r2, 63
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
