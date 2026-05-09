; DESCRIPTION: Places a white 50x63 rectangle at position (40, 148).
; PLAN: r0=40(x), r1=148(y), r2=50(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 148
LDI r2, 50
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
