; DESCRIPTION: Renders a green box of size 79x57 starting at (405, 112).
; PLAN: r0=405(x), r1=112(y), r2=79(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 112
LDI r2, 79
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
