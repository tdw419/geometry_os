; DESCRIPTION: Renders a blue box of size 47x27 starting at (193, 4).
; PLAN: r0=193(x), r1=4(y), r2=47(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 4
LDI r2, 47
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
