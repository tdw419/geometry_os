; DESCRIPTION: Renders a blue box of size 14x75 starting at (394, 143).
; PLAN: r0=394(x), r1=143(y), r2=14(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 143
LDI r2, 14
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
