; DESCRIPTION: Renders a green box of size 80x14 starting at (174, 131).
; PLAN: r0=174(x), r1=131(y), r2=80(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 131
LDI r2, 80
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
