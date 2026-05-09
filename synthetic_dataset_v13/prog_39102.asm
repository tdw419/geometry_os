; DESCRIPTION: Places a orange 65x80 rectangle at position (365, 113).
; PLAN: r0=365(x), r1=113(y), r2=65(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 113
LDI r2, 65
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
