; DESCRIPTION: Renders a magenta box of size 25x120 starting at (186, 107).
; PLAN: r0=186(x), r1=107(y), r2=25(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 107
LDI r2, 25
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
