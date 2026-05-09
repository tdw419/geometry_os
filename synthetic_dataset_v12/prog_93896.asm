; DESCRIPTION: Places a orange 64x20 rectangle at position (171, 174).
; PLAN: r0=171(x), r1=174(y), r2=64(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 174
LDI r2, 64
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
