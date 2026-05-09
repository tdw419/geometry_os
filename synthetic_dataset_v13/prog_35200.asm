; DESCRIPTION: Renders a purple box of size 75x102 starting at (273, 143).
; PLAN: r0=273(x), r1=143(y), r2=75(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 143
LDI r2, 75
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
