; DESCRIPTION: Places a white 113x57 rectangle at position (71, 133).
; PLAN: r0=71(x), r1=133(y), r2=113(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 133
LDI r2, 113
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
