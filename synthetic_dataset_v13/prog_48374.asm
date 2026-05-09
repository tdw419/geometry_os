; DESCRIPTION: Renders a green box of size 50x70 starting at (72, 54).
; PLAN: r0=72(x), r1=54(y), r2=50(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 54
LDI r2, 50
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
