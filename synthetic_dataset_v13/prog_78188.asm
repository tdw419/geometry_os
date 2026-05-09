; DESCRIPTION: Places a cyan 103x41 rectangle at position (91, 45).
; PLAN: r0=91(x), r1=45(y), r2=103(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 45
LDI r2, 103
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
