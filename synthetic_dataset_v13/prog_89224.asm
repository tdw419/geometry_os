; DESCRIPTION: Renders a magenta box of size 113x80 starting at (7, 143).
; PLAN: r0=7(x), r1=143(y), r2=113(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 143
LDI r2, 113
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
