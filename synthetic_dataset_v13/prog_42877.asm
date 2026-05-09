; DESCRIPTION: Places a orange 117x40 rectangle at position (16, 146).
; PLAN: r0=16(x), r1=146(y), r2=117(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 146
LDI r2, 117
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
