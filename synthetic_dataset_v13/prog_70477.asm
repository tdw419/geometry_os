; DESCRIPTION: Places a white 27x112 rectangle at position (430, 82).
; PLAN: r0=430(x), r1=82(y), r2=27(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 82
LDI r2, 27
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
