; DESCRIPTION: Places a white 55x21 rectangle at position (401, 104).
; PLAN: r0=401(x), r1=104(y), r2=55(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 104
LDI r2, 55
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
