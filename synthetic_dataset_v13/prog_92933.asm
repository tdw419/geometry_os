; DESCRIPTION: Renders a magenta box of size 103x77 starting at (153, 107).
; PLAN: r0=153(x), r1=107(y), r2=103(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 107
LDI r2, 103
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
