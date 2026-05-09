; DESCRIPTION: Places a orange 62x38 rectangle at position (150, 186).
; PLAN: r0=150(x), r1=186(y), r2=62(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 186
LDI r2, 62
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
