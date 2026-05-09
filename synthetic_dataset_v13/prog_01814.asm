; DESCRIPTION: Places a red 41x98 rectangle at position (173, 133).
; PLAN: r0=173(x), r1=133(y), r2=41(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 133
LDI r2, 41
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
