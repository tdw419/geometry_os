; DESCRIPTION: Renders a magenta box of size 38x91 starting at (237, 124).
; PLAN: r0=237(x), r1=124(y), r2=38(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 124
LDI r2, 38
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
