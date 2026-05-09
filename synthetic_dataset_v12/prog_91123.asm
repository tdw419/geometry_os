; DESCRIPTION: Renders a white box of size 18x86 starting at (353, 159).
; PLAN: r0=353(x), r1=159(y), r2=18(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 159
LDI r2, 18
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
