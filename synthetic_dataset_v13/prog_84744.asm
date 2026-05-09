; DESCRIPTION: Places a cyan 43x82 rectangle at position (262, 121).
; PLAN: r0=262(x), r1=121(y), r2=43(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 121
LDI r2, 43
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
