; DESCRIPTION: Places a white 21x14 rectangle at position (50, 13).
; PLAN: r0=50(x), r1=13(y), r2=21(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 13
LDI r2, 21
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
