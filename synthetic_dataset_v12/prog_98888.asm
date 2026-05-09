; DESCRIPTION: Places a orange 71x70 rectangle at position (315, 174).
; PLAN: r0=315(x), r1=174(y), r2=71(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 174
LDI r2, 71
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
