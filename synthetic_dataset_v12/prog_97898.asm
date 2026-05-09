; DESCRIPTION: Places a red 59x74 rectangle at position (422, 0).
; PLAN: r0=422(x), r1=0(y), r2=59(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 0
LDI r2, 59
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
