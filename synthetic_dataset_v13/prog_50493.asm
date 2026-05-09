; DESCRIPTION: Renders a green box of size 108x92 starting at (217, 127).
; PLAN: r0=217(x), r1=127(y), r2=108(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 127
LDI r2, 108
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
