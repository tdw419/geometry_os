; DESCRIPTION: Renders a magenta box of size 13x33 starting at (198, 17).
; PLAN: r0=198(x), r1=17(y), r2=13(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 17
LDI r2, 13
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
