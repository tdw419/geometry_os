; DESCRIPTION: Renders a yellow box of size 37x27 starting at (39, 212).
; PLAN: r0=39(x), r1=212(y), r2=37(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 212
LDI r2, 37
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
