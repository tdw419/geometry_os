; DESCRIPTION: Renders a green box of size 50x72 starting at (137, 60).
; PLAN: r0=137(x), r1=60(y), r2=50(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 60
LDI r2, 50
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
