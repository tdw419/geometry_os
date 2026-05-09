; DESCRIPTION: Places a orange 95x45 rectangle at position (306, 38).
; PLAN: r0=306(x), r1=38(y), r2=95(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 38
LDI r2, 95
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
