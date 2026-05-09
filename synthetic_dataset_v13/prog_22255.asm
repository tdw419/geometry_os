; DESCRIPTION: Renders a green box of size 87x83 starting at (352, 155).
; PLAN: r0=352(x), r1=155(y), r2=87(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 155
LDI r2, 87
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
