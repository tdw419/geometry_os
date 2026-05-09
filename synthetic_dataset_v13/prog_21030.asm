; DESCRIPTION: Renders a purple box of size 101x90 starting at (102, 143).
; PLAN: r0=102(x), r1=143(y), r2=101(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 143
LDI r2, 101
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
