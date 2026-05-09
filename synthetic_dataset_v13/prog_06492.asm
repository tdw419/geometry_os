; DESCRIPTION: Renders a green box of size 28x92 starting at (405, 157).
; PLAN: r0=405(x), r1=157(y), r2=28(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 157
LDI r2, 28
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
