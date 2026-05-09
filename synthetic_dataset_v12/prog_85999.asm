; DESCRIPTION: Renders a green box of size 87x12 starting at (111, 143).
; PLAN: r0=111(x), r1=143(y), r2=87(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 143
LDI r2, 87
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
