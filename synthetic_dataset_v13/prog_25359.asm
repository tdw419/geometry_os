; DESCRIPTION: Renders a white box of size 50x104 starting at (143, 126).
; PLAN: r0=143(x), r1=126(y), r2=50(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 126
LDI r2, 50
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
