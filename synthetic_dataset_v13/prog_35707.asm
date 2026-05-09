; DESCRIPTION: Places a white 46x85 rectangle at position (440, 10).
; PLAN: r0=440(x), r1=10(y), r2=46(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 10
LDI r2, 46
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
