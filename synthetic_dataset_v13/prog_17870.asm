; DESCRIPTION: Places a white 25x35 rectangle at position (464, 123).
; PLAN: r0=464(x), r1=123(y), r2=25(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 123
LDI r2, 25
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
