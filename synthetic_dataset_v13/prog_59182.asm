; DESCRIPTION: Renders a green box of size 31x27 starting at (39, 39).
; PLAN: r0=39(x), r1=39(y), r2=31(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 39
LDI r2, 31
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
