; DESCRIPTION: Renders a white box of size 103x98 starting at (128, 50).
; PLAN: r0=128(x), r1=50(y), r2=103(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 50
LDI r2, 103
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
