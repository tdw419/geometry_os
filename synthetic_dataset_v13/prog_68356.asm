; DESCRIPTION: Renders a magenta box of size 90x50 starting at (198, 48).
; PLAN: r0=198(x), r1=48(y), r2=90(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 48
LDI r2, 90
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
