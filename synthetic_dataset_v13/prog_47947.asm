; DESCRIPTION: Places a orange 71x80 rectangle at position (168, 55).
; PLAN: r0=168(x), r1=55(y), r2=71(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 55
LDI r2, 71
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
