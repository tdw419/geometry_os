; DESCRIPTION: Renders a magenta box of size 64x16 starting at (374, 208).
; PLAN: r0=374(x), r1=208(y), r2=64(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 208
LDI r2, 64
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
