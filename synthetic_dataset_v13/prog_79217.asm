; DESCRIPTION: Renders a green box of size 28x100 starting at (167, 50).
; PLAN: r0=167(x), r1=50(y), r2=28(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 50
LDI r2, 28
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
