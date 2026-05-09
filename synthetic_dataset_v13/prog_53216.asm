; DESCRIPTION: Renders a green box of size 44x62 starting at (103, 128).
; PLAN: r0=103(x), r1=128(y), r2=44(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 128
LDI r2, 44
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
