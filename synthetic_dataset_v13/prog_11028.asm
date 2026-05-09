; DESCRIPTION: Renders a green box of size 44x82 starting at (94, 48).
; PLAN: r0=94(x), r1=48(y), r2=44(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 48
LDI r2, 44
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
