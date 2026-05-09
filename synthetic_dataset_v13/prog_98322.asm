; DESCRIPTION: Places a orange 24x47 rectangle at position (413, 164).
; PLAN: r0=413(x), r1=164(y), r2=24(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 164
LDI r2, 24
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
