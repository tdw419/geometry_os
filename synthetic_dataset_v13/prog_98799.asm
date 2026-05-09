; DESCRIPTION: Renders a white box of size 13x115 starting at (400, 90).
; PLAN: r0=400(x), r1=90(y), r2=13(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 90
LDI r2, 13
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
