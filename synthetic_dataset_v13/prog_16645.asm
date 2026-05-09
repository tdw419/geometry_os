; DESCRIPTION: Places a orange 113x82 rectangle at position (369, 70).
; PLAN: r0=369(x), r1=70(y), r2=113(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 70
LDI r2, 113
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
