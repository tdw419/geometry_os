; DESCRIPTION: Renders a magenta box of size 77x90 starting at (237, 152).
; PLAN: r0=237(x), r1=152(y), r2=77(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 152
LDI r2, 77
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
