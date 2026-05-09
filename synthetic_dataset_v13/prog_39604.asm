; DESCRIPTION: Renders a green box of size 52x43 starting at (164, 177).
; PLAN: r0=164(x), r1=177(y), r2=52(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 177
LDI r2, 52
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
