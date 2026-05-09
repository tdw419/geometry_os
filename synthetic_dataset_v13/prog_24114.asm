; DESCRIPTION: Places a white 110x35 rectangle at position (281, 197).
; PLAN: r0=281(x), r1=197(y), r2=110(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 197
LDI r2, 110
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
