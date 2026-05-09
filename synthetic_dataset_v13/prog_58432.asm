; DESCRIPTION: Places a orange 40x53 rectangle at position (281, 0).
; PLAN: r0=281(x), r1=0(y), r2=40(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 0
LDI r2, 40
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
