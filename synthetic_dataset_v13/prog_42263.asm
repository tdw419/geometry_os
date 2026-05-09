; DESCRIPTION: Renders a green box of size 72x43 starting at (433, 189).
; PLAN: r0=433(x), r1=189(y), r2=72(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 189
LDI r2, 72
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
