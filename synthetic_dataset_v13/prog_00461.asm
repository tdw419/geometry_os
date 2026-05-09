; DESCRIPTION: Renders a green box of size 113x90 starting at (336, 52).
; PLAN: r0=336(x), r1=52(y), r2=113(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 52
LDI r2, 113
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
