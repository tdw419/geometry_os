; DESCRIPTION: Renders a magenta box of size 51x38 starting at (422, 202).
; PLAN: r0=422(x), r1=202(y), r2=51(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 202
LDI r2, 51
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
