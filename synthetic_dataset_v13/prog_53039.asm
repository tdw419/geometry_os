; DESCRIPTION: Places a white 41x45 rectangle at position (190, 70).
; PLAN: r0=190(x), r1=70(y), r2=41(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 70
LDI r2, 41
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
