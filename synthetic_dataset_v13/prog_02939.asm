; DESCRIPTION: Renders a magenta box of size 112x27 starting at (298, 120).
; PLAN: r0=298(x), r1=120(y), r2=112(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 120
LDI r2, 112
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
