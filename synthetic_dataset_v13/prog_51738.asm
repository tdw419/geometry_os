; DESCRIPTION: Places a white 103x94 rectangle at position (214, 141).
; PLAN: r0=214(x), r1=141(y), r2=103(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 141
LDI r2, 103
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
