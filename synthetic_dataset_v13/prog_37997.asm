; DESCRIPTION: Renders a green box of size 50x53 starting at (9, 33).
; PLAN: r0=9(x), r1=33(y), r2=50(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 33
LDI r2, 50
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
