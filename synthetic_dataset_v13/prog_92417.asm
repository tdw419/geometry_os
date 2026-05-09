; DESCRIPTION: Renders a magenta box of size 72x46 starting at (283, 107).
; PLAN: r0=283(x), r1=107(y), r2=72(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 107
LDI r2, 72
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
