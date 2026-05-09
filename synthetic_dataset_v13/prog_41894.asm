; DESCRIPTION: Renders a green box of size 33x10 starting at (408, 195).
; PLAN: r0=408(x), r1=195(y), r2=33(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 195
LDI r2, 33
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
