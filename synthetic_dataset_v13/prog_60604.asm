; DESCRIPTION: Places a white 21x46 rectangle at position (464, 121).
; PLAN: r0=464(x), r1=121(y), r2=21(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 121
LDI r2, 21
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
