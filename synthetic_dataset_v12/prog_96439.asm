; DESCRIPTION: Renders a white box of size 98x117 starting at (143, 90).
; PLAN: r0=143(x), r1=90(y), r2=98(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 90
LDI r2, 98
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
