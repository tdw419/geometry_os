; DESCRIPTION: Renders a magenta box of size 50x14 starting at (110, 186).
; PLAN: r0=110(x), r1=186(y), r2=50(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 186
LDI r2, 50
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
