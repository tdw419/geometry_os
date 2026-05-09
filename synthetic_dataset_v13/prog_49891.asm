; DESCRIPTION: Renders a green box of size 90x48 starting at (354, 90).
; PLAN: r0=354(x), r1=90(y), r2=90(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 90
LDI r2, 90
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
