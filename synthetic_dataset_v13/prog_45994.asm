; DESCRIPTION: Renders a blue box of size 10x52 starting at (479, 134).
; PLAN: r0=479(x), r1=134(y), r2=10(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 134
LDI r2, 10
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
