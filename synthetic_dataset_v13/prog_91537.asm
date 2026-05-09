; DESCRIPTION: Places a orange 70x49 rectangle at position (386, 197).
; PLAN: r0=386(x), r1=197(y), r2=70(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 197
LDI r2, 70
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
