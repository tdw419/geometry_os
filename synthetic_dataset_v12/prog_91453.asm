; DESCRIPTION: Renders a yellow box of size 60x83 starting at (231, 94).
; PLAN: r0=231(x), r1=94(y), r2=60(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 94
LDI r2, 60
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
