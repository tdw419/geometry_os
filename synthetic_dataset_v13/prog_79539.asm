; DESCRIPTION: Renders a white box of size 50x82 starting at (223, 154).
; PLAN: r0=223(x), r1=154(y), r2=50(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 154
LDI r2, 50
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
