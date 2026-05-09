; DESCRIPTION: Renders a green box of size 38x50 starting at (466, 132).
; PLAN: r0=466(x), r1=132(y), r2=38(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 132
LDI r2, 38
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
