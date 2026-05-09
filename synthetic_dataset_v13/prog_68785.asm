; DESCRIPTION: Places a white 54x24 rectangle at position (350, 52).
; PLAN: r0=350(x), r1=52(y), r2=54(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 52
LDI r2, 54
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
