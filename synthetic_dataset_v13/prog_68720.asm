; DESCRIPTION: Places a white 80x63 rectangle at position (400, 29).
; PLAN: r0=400(x), r1=29(y), r2=80(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 29
LDI r2, 80
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
