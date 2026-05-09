; DESCRIPTION: Places a red 67x65 rectangle at position (207, 146).
; PLAN: r0=207(x), r1=146(y), r2=67(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 146
LDI r2, 67
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
