; DESCRIPTION: Places a orange 31x17 rectangle at position (121, 146).
; PLAN: r0=121(x), r1=146(y), r2=31(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 146
LDI r2, 31
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
