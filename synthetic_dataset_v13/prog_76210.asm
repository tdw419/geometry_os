; DESCRIPTION: Places a white 82x17 rectangle at position (413, 9).
; PLAN: r0=413(x), r1=9(y), r2=82(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 9
LDI r2, 82
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
