; DESCRIPTION: Places a cyan 32x41 rectangle at position (125, 31).
; PLAN: r0=125(x), r1=31(y), r2=32(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 31
LDI r2, 32
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
