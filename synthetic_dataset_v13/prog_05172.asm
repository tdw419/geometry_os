; DESCRIPTION: Renders a magenta box of size 21x115 starting at (420, 86).
; PLAN: r0=420(x), r1=86(y), r2=21(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 86
LDI r2, 21
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
