; DESCRIPTION: Renders a green box of size 90x83 starting at (82, 131).
; PLAN: r0=82(x), r1=131(y), r2=90(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 131
LDI r2, 90
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
