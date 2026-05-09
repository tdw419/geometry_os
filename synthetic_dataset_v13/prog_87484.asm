; DESCRIPTION: Places a red 76x38 rectangle at position (428, 107).
; PLAN: r0=428(x), r1=107(y), r2=76(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 107
LDI r2, 76
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
