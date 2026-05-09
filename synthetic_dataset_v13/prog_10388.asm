; DESCRIPTION: Renders a purple box of size 48x41 starting at (438, 120).
; PLAN: r0=438(x), r1=120(y), r2=48(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 120
LDI r2, 48
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
