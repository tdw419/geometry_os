; DESCRIPTION: Places a orange 38x60 rectangle at position (175, 96).
; PLAN: r0=175(x), r1=96(y), r2=38(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 96
LDI r2, 38
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
