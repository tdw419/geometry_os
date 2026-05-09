; DESCRIPTION: Places a white 21x70 rectangle at position (154, 21).
; PLAN: r0=154(x), r1=21(y), r2=21(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 21
LDI r2, 21
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
