; DESCRIPTION: Renders a magenta box of size 94x82 starting at (7, 173).
; PLAN: r0=7(x), r1=173(y), r2=94(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 173
LDI r2, 94
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
