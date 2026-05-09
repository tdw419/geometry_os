; DESCRIPTION: Renders a purple box of size 32x61 starting at (160, 174).
; PLAN: r0=160(x), r1=174(y), r2=32(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 174
LDI r2, 32
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
