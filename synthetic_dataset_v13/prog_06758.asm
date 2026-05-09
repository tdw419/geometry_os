; DESCRIPTION: Places a orange 114x50 rectangle at position (271, 174).
; PLAN: r0=271(x), r1=174(y), r2=114(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 174
LDI r2, 114
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
