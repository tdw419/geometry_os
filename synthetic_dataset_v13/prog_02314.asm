; DESCRIPTION: Renders a white box of size 98x87 starting at (206, 63).
; PLAN: r0=206(x), r1=63(y), r2=98(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 63
LDI r2, 98
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
