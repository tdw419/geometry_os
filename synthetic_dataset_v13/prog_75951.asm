; DESCRIPTION: Places a white 57x14 rectangle at position (218, 117).
; PLAN: r0=218(x), r1=117(y), r2=57(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 117
LDI r2, 57
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
