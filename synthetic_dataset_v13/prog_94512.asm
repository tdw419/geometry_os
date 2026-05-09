; DESCRIPTION: Renders a green box of size 36x79 starting at (203, 143).
; PLAN: r0=203(x), r1=143(y), r2=36(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 143
LDI r2, 36
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
