; DESCRIPTION: Places a orange 102x109 rectangle at position (173, 129).
; PLAN: r0=173(x), r1=129(y), r2=102(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 129
LDI r2, 102
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
