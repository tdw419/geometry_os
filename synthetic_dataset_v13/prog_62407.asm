; DESCRIPTION: Renders a green box of size 68x70 starting at (75, 127).
; PLAN: r0=75(x), r1=127(y), r2=68(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 127
LDI r2, 68
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
