; DESCRIPTION: Places a cyan 95x58 rectangle at position (217, 41).
; PLAN: r0=217(x), r1=41(y), r2=95(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 41
LDI r2, 95
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
