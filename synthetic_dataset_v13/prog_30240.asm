; DESCRIPTION: Renders a blue box of size 107x30 starting at (352, 120).
; PLAN: r0=352(x), r1=120(y), r2=107(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 120
LDI r2, 107
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
