; DESCRIPTION: Renders a yellow box of size 87x99 starting at (231, 107).
; PLAN: r0=231(x), r1=107(y), r2=87(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 107
LDI r2, 87
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
