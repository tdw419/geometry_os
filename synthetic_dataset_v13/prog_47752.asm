; DESCRIPTION: Places a orange 41x91 rectangle at position (146, 4).
; PLAN: r0=146(x), r1=4(y), r2=41(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 4
LDI r2, 41
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
