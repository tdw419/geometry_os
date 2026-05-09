; DESCRIPTION: Renders a black box of size 87x35 starting at (406, 168).
; PLAN: r0=406(x), r1=168(y), r2=87(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 168
LDI r2, 87
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
