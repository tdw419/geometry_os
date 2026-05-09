; DESCRIPTION: Draws a green rectangle at (443, 107) with width 45 and height 95.
; PLAN: r0=443(x), r1=107(y), r2=45(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 107
LDI r2, 45
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
