; DESCRIPTION: Places a cyan 41x10 rectangle at position (435, 100).
; PLAN: r0=435(x), r1=100(y), r2=41(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 100
LDI r2, 41
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
