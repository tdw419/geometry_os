; DESCRIPTION: Places a white 106x12 rectangle at position (180, 123).
; PLAN: r0=180(x), r1=123(y), r2=106(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 123
LDI r2, 106
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
