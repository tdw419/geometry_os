; DESCRIPTION: Places a orange 48x60 rectangle at position (234, 146).
; PLAN: r0=234(x), r1=146(y), r2=48(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 146
LDI r2, 48
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
