; DESCRIPTION: Places a white 24x16 rectangle at position (464, 89).
; PLAN: r0=464(x), r1=89(y), r2=24(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 89
LDI r2, 24
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
