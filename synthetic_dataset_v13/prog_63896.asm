; DESCRIPTION: Renders a green box of size 75x50 starting at (241, 60).
; PLAN: r0=241(x), r1=60(y), r2=75(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 60
LDI r2, 75
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
