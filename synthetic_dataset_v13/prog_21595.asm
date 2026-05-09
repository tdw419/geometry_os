; DESCRIPTION: Places a red 67x47 rectangle at position (50, 187).
; PLAN: r0=50(x), r1=187(y), r2=67(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 187
LDI r2, 67
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
