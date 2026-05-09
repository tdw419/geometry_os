; DESCRIPTION: Renders a green box of size 58x109 starting at (406, 120).
; PLAN: r0=406(x), r1=120(y), r2=58(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 120
LDI r2, 58
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
