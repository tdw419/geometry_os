; DESCRIPTION: Places a white 120x82 rectangle at position (226, 98).
; PLAN: r0=226(x), r1=98(y), r2=120(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 98
LDI r2, 120
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
