; DESCRIPTION: Places a white 38x89 rectangle at position (255, 150).
; PLAN: r0=255(x), r1=150(y), r2=38(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 150
LDI r2, 38
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
